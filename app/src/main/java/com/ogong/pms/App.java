package com.ogong.pms;

import static com.ogong.menu.Menu.ADMIN_LOGIN;
//import static com.ogong.menu.Menu.ADMIN_LOGOUT;
import static com.ogong.menu.Menu.CEO_LOGIN;
//import static com.ogong.menu.Menu.PER_LOGOUT;
import static com.ogong.menu.Menu.LOGOUT;
//import static com.ogong.menu.Menu.CEO_LOGOUT;
import static com.ogong.menu.Menu.PER_LOGIN;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import com.ogong.menu.Menu;
import com.ogong.menu.MenuGroup;
import com.ogong.pms.domain.Admin;
import com.ogong.pms.domain.AdminNotice;
import com.ogong.pms.domain.AskBoard;
import com.ogong.pms.domain.Cafe;
import com.ogong.pms.domain.CafeReservation;
import com.ogong.pms.domain.CafeReview;
import com.ogong.pms.domain.CafeRoom;
import com.ogong.pms.domain.Calender;
import com.ogong.pms.domain.CeoMember;
import com.ogong.pms.domain.Comment;
import com.ogong.pms.domain.FreeBoard;
import com.ogong.pms.domain.Member;
import com.ogong.pms.domain.Study;
import com.ogong.pms.domain.ToDo;
import com.ogong.pms.handler.AdminCafeControlHandler;
import com.ogong.pms.handler.AdminCafeReviewListControlHandler;
import com.ogong.pms.handler.AdminInfoHandler;
import com.ogong.pms.handler.AdminMemberDeleteHandler;
import com.ogong.pms.handler.AdminMemberDetailHandler;
import com.ogong.pms.handler.AdminMemberUpdateHandler;
import com.ogong.pms.handler.AdminNoticeAddHandler;
import com.ogong.pms.handler.AdminNoticeDeleteHandler;
import com.ogong.pms.handler.AdminNoticeDetailHandler;
import com.ogong.pms.handler.AdminNoticeListHandler;
import com.ogong.pms.handler.AdminNoticeUpdateHandler;
import com.ogong.pms.handler.AdminStudyDeleteHandler;
import com.ogong.pms.handler.AskBoardAddHandler;
import com.ogong.pms.handler.AskBoardDeleteHandler;
import com.ogong.pms.handler.AskBoardDetailHandler;
import com.ogong.pms.handler.AskBoardListHandler;
import com.ogong.pms.handler.AskBoardMyListHandler;
import com.ogong.pms.handler.AskBoardUpdateHandler;
import com.ogong.pms.handler.AuthAdminLoginHandler;
import com.ogong.pms.handler.AuthAdminLogoutHandler;
import com.ogong.pms.handler.AuthCeoMemberLoginHandler;
import com.ogong.pms.handler.AuthCeoMemberLogoutHandler;
import com.ogong.pms.handler.AuthPerMemberLoginHandler;
import com.ogong.pms.handler.AuthPerMemberLogoutHandler;
import com.ogong.pms.handler.CafeAddHandler;
import com.ogong.pms.handler.CafeDeleteHandler;
import com.ogong.pms.handler.CafeDetailHandler;
import com.ogong.pms.handler.CafeListHandler;
import com.ogong.pms.handler.CafeMyReservationListHandler;
import com.ogong.pms.handler.CafeMyReviewListHandler;
import com.ogong.pms.handler.CafeSearchHandler;
import com.ogong.pms.handler.CafeUpdateHandler;
import com.ogong.pms.handler.CeoAddHandler;
import com.ogong.pms.handler.CeoDetailHandler;
import com.ogong.pms.handler.CeoFindIdPwHandler;
import com.ogong.pms.handler.CeoMyCafeListHandler;
import com.ogong.pms.handler.Command;
import com.ogong.pms.handler.MemberAddHandler;
import com.ogong.pms.handler.MemberDeleteHandler;
import com.ogong.pms.handler.MemberDetailHandler;
import com.ogong.pms.handler.MemberFindIdPwHandler;
import com.ogong.pms.handler.MemberListHandler;
import com.ogong.pms.handler.MemberUpdateHandler;
import com.ogong.pms.handler.MyStudyCalender;
import com.ogong.pms.handler.MyStudyDeleteHandler;
import com.ogong.pms.handler.MyStudyDetailHandler;
import com.ogong.pms.handler.MyStudyFreeBoard;
import com.ogong.pms.handler.MyStudyListHandler;
import com.ogong.pms.handler.MyStudyToDo;
import com.ogong.pms.handler.PromptCeoMember;
import com.ogong.pms.handler.PromptPerMember;
import com.ogong.pms.handler.StudyAddHandler;
import com.ogong.pms.handler.StudyListHandler;
import com.ogong.pms.handler.StudySearchHandler;
import com.ogong.pms.handler.StudyUpdateHandler;
import com.ogong.util.Prompt;

public class App {
  List<Study> studyList = new LinkedList<>();
  List<Member> memberList = new LinkedList<>();
  List<AdminNotice> adminNoticeList = new ArrayList<>();
  List<AskBoard> askBoardList = new ArrayList<>();
  List<Cafe> cafeList = new ArrayList<>();
  List<CafeReview> cafeReviewList = new ArrayList<>();
  List<CafeReservation> cafeReservationList = new ArrayList<>();
  List<ToDo> toDoList = new ArrayList<>();
  List<FreeBoard> freeBoardList = new ArrayList<>();
  List<Calender> calenderList = new ArrayList<>();
  List<Admin> adminList = new ArrayList<>();
  List<CeoMember> ceoMemberList = new ArrayList<>();
  List<Comment> commentList = new ArrayList<>();
  List<CafeRoom> cafeRoomList = new  ArrayList<>();

  // 해시맵 추가(0904)
  HashMap<String, Command> commandMap = new HashMap<>();

  PromptPerMember promptPerMember = new PromptPerMember(memberList); 
  PromptCeoMember promptCeoMember = new PromptCeoMember(ceoMemberList);


  //CeoMemberHandler ceoMemberHandler = new CeoMemberHandler(ceoMemberList);
  //MyStudyHandler myStudyHandler = new MyStudyHandler(studyList, studyHandler);

  class MenuItem extends Menu {
    String menuId;

    public MenuItem(String title, String menuId) {
      super(title);
      this.menuId = menuId;
    }

    public MenuItem(String title, int accessScope, String menuId) {
      super(title, accessScope);
      this.menuId = menuId;
    }

    @Override
    public void execute() {
      Command command = commandMap.get(menuId);
      command.execute();
    }
  }

  public static void main(String[] args) {
    App app = new App(); 
    app.welcomeservice();
  }

  public App() {
    commandMap.put("/member/add", new MemberAddHandler(memberList));
    commandMap.put("/member/list", new MemberListHandler(memberList, commandMap));
    commandMap.put("/member/detail", new MemberDetailHandler(memberList, commandMap));
    commandMap.put("/member/update", new MemberUpdateHandler(memberList));
    commandMap.put("/member/delete", new MemberDeleteHandler(memberList, promptPerMember));

    commandMap.put("/ceoMember/login", new AuthCeoMemberLoginHandler(ceoMemberList));
    commandMap.put("/ceoMember/logout", new AuthCeoMemberLogoutHandler());
    commandMap.put("/ceoMember/findIdPw", new CeoFindIdPwHandler(ceoMemberList, promptCeoMember));
    commandMap.put("/ceoMember/add", new CeoAddHandler(ceoMemberList));
    commandMap.put("/ceoMember/page", new CeoDetailHandler(ceoMemberList));
    commandMap.put("/ceoMember/myCafeList", new CeoMyCafeListHandler(ceoMemberList, cafeList, cafeReviewList, promptPerMember));

    commandMap.put("/adminMember/detail", new AdminMemberDetailHandler(memberList, promptPerMember));
    commandMap.put("/adminMember/update", new AdminMemberUpdateHandler(memberList, promptPerMember));
    commandMap.put("/adminMember/delete", new AdminMemberDeleteHandler(memberList, promptPerMember));

    commandMap.put("/askBoard/add",  new AskBoardAddHandler(askBoardList, memberList, commentList));
    commandMap.put("/askBoard/list", new AskBoardListHandler(askBoardList, commentList));
    commandMap.put("/askBoard/detail", new AskBoardDetailHandler(askBoardList, commentList, adminList));
    commandMap.put("/askBoard/update", new AskBoardUpdateHandler(askBoardList, commentList));
    commandMap.put("/askBoard/delete", new AskBoardDeleteHandler(askBoardList, commentList));
    commandMap.put("/askBoard/myList", new AskBoardMyListHandler(askBoardList, commentList));

    commandMap.put("/cafe/add",
        new CafeAddHandler(cafeList, cafeReviewList, cafeReservationList, ceoMemberList));
    commandMap.put("/cafe/list", 
        new CafeListHandler(cafeList, cafeReviewList, cafeReservationList, commandMap));
    commandMap.put("/cafe/detail",
        new CafeDetailHandler(cafeList, cafeReviewList, cafeReservationList, promptPerMember, cafeRoomList));
    commandMap.put("/cafe/update",
        new CafeUpdateHandler(cafeList, cafeReviewList, cafeReservationList));
    commandMap.put("/cafe/delete",
        new CafeDeleteHandler(cafeList, cafeReviewList, cafeReservationList));
    commandMap.put("/cafe/search", 
        new CafeSearchHandler(cafeList, cafeReviewList, cafeReservationList, commandMap));
    commandMap.put("/cafe/reservationList",
        new CafeMyReservationListHandler(cafeList, cafeReviewList, cafeReservationList, promptPerMember, cafeRoomList));
    commandMap.put("/cafe/myReviewList", 
        new CafeMyReviewListHandler(cafeList, cafeReviewList, cafeReservationList));

    commandMap.put("/cafe/control", new AdminCafeControlHandler(cafeList, cafeReviewList, cafeReservationList, promptPerMember));
    commandMap.put("/cafe/reviewList", new AdminCafeReviewListControlHandler(cafeList, cafeReviewList, cafeReservationList)); 

    commandMap.put("/adminNotice/add", new AdminNoticeAddHandler(adminNoticeList));
    commandMap.put("/adminNotice/list", new AdminNoticeListHandler(adminNoticeList));
    commandMap.put("/adminNotice/update", new AdminNoticeUpdateHandler(adminNoticeList));
    commandMap.put("/adminNotice/detail", new AdminNoticeDetailHandler(adminNoticeList));
    commandMap.put("/adminNotice/delete", new AdminNoticeDeleteHandler(adminNoticeList));

    commandMap.put("/admin/login", new AuthAdminLoginHandler(adminList));
    commandMap.put("/admin/logout", new AuthAdminLogoutHandler());

    commandMap.put("/member/login", new AuthPerMemberLoginHandler(promptPerMember, memberList));
    commandMap.put("/member/findIdPw", new MemberFindIdPwHandler(promptPerMember));
    commandMap.put("/member/logout", new AuthPerMemberLogoutHandler());

    commandMap.put("/admin/info", new AdminInfoHandler(adminList));

    commandMap.put("/study/add", new StudyAddHandler(studyList, toDoList, promptPerMember));
    commandMap.put("/study/list", new StudyListHandler(studyList));
    commandMap.put("/study/update", new StudyUpdateHandler(studyList));
    commandMap.put("/study/search", new StudySearchHandler(studyList));
    commandMap.put("/study/delete", new AdminStudyDeleteHandler(studyList));


    // 내 스터디 하위
    MyStudyCalender myStudyCalender = new MyStudyCalender(calenderList, studyList);
    MyStudyToDo myStudyToDo = new MyStudyToDo(toDoList, studyList);
    MyStudyFreeBoard myStudyFreeBoard = new MyStudyFreeBoard(freeBoardList, commentList, memberList, studyList);

    // 내 스터디 
    commandMap.put("/myStudy/detail", new MyStudyDetailHandler(studyList, myStudyToDo,
        myStudyCalender, myStudyFreeBoard, commentList));

    commandMap.put("/myStudy/delete", new MyStudyDeleteHandler(studyList));
    commandMap.put("/myStudy/list", new MyStudyListHandler(studyList, commandMap));

  }

  void welcomeservice() {
    welcome().execute();
    service();
  }

  void service() {
    loadObjects("member.data3", memberList);
    loadObjects("ceoMember.data3", ceoMemberList);
    loadObjects("admin.data3", adminList);
    loadObjects("adminNotice.data3" , adminNoticeList);
    loadObjects("askBoard.data3", askBoardList);
    loadObjects("cafe.data3", cafeList);
    loadObjects("cafeReservation.data3", cafeReservationList);
    loadObjects("cafeReview.data3", cafeReviewList);
    loadObjects("cafeRoom.data3", cafeRoomList);
    loadObjects("study.data3", studyList);
    loadObjects("toDo.data3", toDoList);
    loadObjects("calender.data3", calenderList);
    loadObjects("freeBoard.data3", freeBoardList);

    createMenu().execute();
    Prompt.close();

    //    saveObjects("member.data3", memberList);  // MemberAddHandler
    //    saveObjects("ceoMember.data3", ceoMemberList);   // CeoAddHandler
    //    saveObjects("admin.data3", adminList); // AuthAdminLoginHandler
    //    saveObjects("adminNotice.data3" , adminNoticeList);  // AdminNoticeAddHandler
    //    saveObjects("askBoard.data3", askBoardList);  // AskBoardAddHandler
    //    saveObjects("cafe.data3", cafeList); // CafeAddHandler
    //    saveObjects("cafeReservation.data3", cafeReservationList);  // CafeMyReservationListHandler
    //    saveObjects("cafeReview.data3", cafeReviewList);
    //    saveObjects("cafeRoom.data3", cafeRoomList); // CafeDetailHandler 테스트값 : 2021-10-10
    //    saveObjects("study.data3", studyList);   // StudyAddHandler
    //    saveObjects("toDo.data3", toDoList);  // MyStudyToDo
    //    saveObjects("calender.data3", calenderList); // MyStudyCalender
    //    saveObjects("freeBoard.data3", freeBoardList); // MyStudyFreeBoard

  }

  static Menu welcome() {
    ////////////////////////////////////////////////////////////////
    System.out.println("\u2728" + "오늘의 공부" + "\u2728");
    System.out.println("\u0020\u2229__\u2229\u0020\u00a0\u00a0\u00a0\u0020\u2229__\u2229\u0020");
    System.out.println("\u0028\u0020\u0027\u03c0\u0027\u0029\u00a0\u00a0\u00a0\u0028\u0027\u03c0\u0027\u00a0\u0029");
    System.out.println("\u0028\u0020\u2283\u2755\u2282\u0029\u00a0\u00a0\u00a0\u0028\u2283\u2755\u2282\u00a0\u0029");
    ////////////////////////////////////////////////////////////////
    MenuGroup welcomeMenuGroup = new MenuGroup("발표를 시작하겠습니다");
    welcomeMenuGroup.setPrevMenuTitle("시작");
    return welcomeMenuGroup;
  }


  //--------------------------------------------------------
  Menu createMenu() {

    MenuGroup mainMenuGroup = new MenuGroup("메인");
    mainMenuGroup.setPrevMenuTitle("종료");

    mainMenuGroup.add(createAdminMenu());
    mainMenuGroup.add(createMemberMenu());
    mainMenuGroup.add(createCeoMenu());

    return mainMenuGroup;
  }

  //파일 입출력 -----------------------------------------------------------------------
  @SuppressWarnings("unchecked")
  private <E> void loadObjects(String filepath, List<E> list) {
    try (ObjectInputStream in = new ObjectInputStream(
        new FileInputStream(filepath))) {

      list.addAll((List<E>) in.readObject());

      System.out.printf("%s 파일 로딩 완료!\n", filepath);

    } catch (Exception e) {
      System.out.printf("%s 파일에서 데이터를 읽어 오는 중 오류 발생!\n", filepath);
      e.printStackTrace();
    }
  }

  @SuppressWarnings("unused")
  private <E> void saveObjects(String filepath, List<E> list) {
    try (ObjectOutputStream out = new ObjectOutputStream(
        new FileOutputStream(filepath))) {

      out.writeObject(list);

      System.out.printf("%s 파일 저장 완료!\n", filepath);

    } catch (Exception e) {
      System.out.printf("%s 데이터를 파일에 저장 중 오류 발생!\n", filepath);
      e.printStackTrace();
    }
  }


  // -----------------------------------------------------------------------------------------------
  // 관리자 메인
  Menu createAdminMenu() {
    MenuGroup adminMenuGroup = new MenuGroup("관리자");

    adminMenuGroup.add(new MenuItem("로그인", LOGOUT, "/admin/login"));
    adminMenuGroup.add(new MenuItem("로그아웃", ADMIN_LOGIN, "/admin/logout"));
    adminMenuGroup.add(new MenuItem("마이 페이지", ADMIN_LOGIN, "/admin/info"));

    adminMenuGroup.add(createControlMemberMenu());  // 회원 관리
    adminMenuGroup.add(createControlStudyMenu());   // 스터디 관리
    adminMenuGroup.add(createControlReviewMenu());  // 장소 관리
    adminMenuGroup.add(createAdminCSMenu());        // 고객센터 관리

    return adminMenuGroup;
  }

  // 관리자 하위 메뉴2 - 회원 관리
  private Menu createControlMemberMenu() {
    MenuGroup adminUserMenu = new MenuGroup("회원 관리", ADMIN_LOGIN); 

    adminUserMenu.add(new MenuItem("개인 회원 조회", "/member/list"));
    adminUserMenu.add(new MenuItem("사장 회원 조회", "ceo 구현 전"));

    return adminUserMenu;
  }

  // 관리자 하위 메뉴3 - 스터디 관리
  private Menu createControlStudyMenu() {
    MenuGroup adminStudyMenu = new MenuGroup("스터디 관리", ADMIN_LOGIN); 

    adminStudyMenu.add(new MenuItem("목록","/study/list"));
    adminStudyMenu.add(new MenuItem("삭제","/study/delete"));
    return adminStudyMenu;
  }

  // 관리자 하위 메뉴4 - 장소 후기 관리
  private Menu createControlReviewMenu() {
    MenuGroup adminCafeReviewMenu = new MenuGroup("장소 관리", ADMIN_LOGIN); 

    adminCafeReviewMenu.add(new MenuItem("장소 게시글 관리","/cafe/control"));
    adminCafeReviewMenu.add(new MenuItem("장소 리뷰 관리","/cafe/reviewList")); 

    return adminCafeReviewMenu;
  }

  //관리자 하위 메뉴5 - 고객센터 관리
  private Menu createAdminCSMenu() {
    MenuGroup csMenu = new MenuGroup("고객센터 관리", ADMIN_LOGIN);

    csMenu.add(createAdminNoticeMenu());
    csMenu.add(createAdminAskMenu());

    return csMenu;
  }

  // 5-1
  private Menu createAdminNoticeMenu() {
    MenuGroup adminNoticeMenu = new MenuGroup("공지사항"); 

    adminNoticeMenu.add(new MenuItem("등록", "/adminNotice/add"));
    adminNoticeMenu.add(new MenuItem("목록", "/adminNotice/list"));
    adminNoticeMenu.add(new MenuItem("상세", "/adminNotice/detail"));
    adminNoticeMenu.add(new MenuItem("수정", "/adminNotice/update"));
    adminNoticeMenu.add(new MenuItem("삭제", "/adminNotice/delete"));

    return adminNoticeMenu;
  }

  // 5-2
  private Menu createAdminAskMenu() {
    MenuGroup adminaskMenu = new MenuGroup("문의사항");

    adminaskMenu.add(new MenuItem("목록", "/askBoard/list"));
    adminaskMenu.add(new MenuItem("상세", "/askBoard/detail"));
    adminaskMenu.add(new MenuItem("삭제", "/askBoard/delete"));

    return adminaskMenu;
  }

  // -----------------------------------------------------------------------------------------------
  // 개인 회원 메인
  Menu createMemberMenu() {
    MenuGroup userMenuGroup = new MenuGroup("개인"); 

    userMenuGroup.add(new MenuItem("회원가입", LOGOUT, "/member/add"));
    userMenuGroup.add(new MenuItem("로그아웃", PER_LOGIN, "/member/logout"));
    userMenuGroup.add(new MenuItem("로그인", LOGOUT, "/member/login"));
    userMenuGroup.add(new MenuItem("ID/PW 찾기", LOGOUT, "/member/findIdPw"));

    userMenuGroup.add(createMyPageMenu());      // 마이페이지
    userMenuGroup.add(createStudyMenu());       // 스터디 찾기

    userMenuGroup.add(new MenuItem("내 스터디", // 내 스터디
        PER_LOGIN, "/myStudy/list"));     

    userMenuGroup.add(createCafeMenu());        // 장소 예약하기
    userMenuGroup.add(createCSMenu());          // 고객센터

    return userMenuGroup;
  }

  // 개인 하위 메뉴2 - 마이페이지 (로그인 했을때)
  private Menu createMyPageMenu() {
    MenuGroup myPageMenu = new MenuGroup("마이 페이지", PER_LOGIN); 

    myPageMenu.add(new MenuItem("개인정보", "/member/detail"));
    myPageMenu.add(new MenuItem("문의내역", "/askBoard/myList"));
    myPageMenu.add(new MenuItem("예약내역", "/cafe/reservationList"));
    myPageMenu.add(new MenuItem("후기내역", "/cafe/myReviewList"));
    myPageMenu.add(new MenuItem("탈퇴하기", "/member/delete"));
    return myPageMenu;
  }

  //개인 하위 메뉴3 - 모든스터디
  private Menu createStudyMenu() {
    MenuGroup allStudyMenu = new MenuGroup("스터디 찾기"); 

    allStudyMenu.add(new MenuItem("등록", PER_LOGIN, "/study/add"));
    allStudyMenu.add(new MenuItem("목록","/study/list"));
    allStudyMenu.add(new MenuItem("검색","/study/search"));
    allStudyMenu.add(new MenuItem("변경", PER_LOGIN, "/study/update"));

    return allStudyMenu; 
  }

  //개인 하위 메뉴5 - 스터디 장소
  private Menu createCafeMenu() {
    MenuGroup cafeMenu = new MenuGroup("장소 예약"); 

    //cafeMenu.add(new MenuItem("등록", "/cafe/add")); // 기업권한
    cafeMenu.add(new MenuItem("목록", "/cafe/list"));
    cafeMenu.add(new MenuItem("검색", "/cafe/search"));
    //cafeMenu.add(new MenuItem("장소 상세", "/cafe/detail"));
    //cafeMenu.add(new MenuItem("수정", "/cafe/update"));
    //cafeMenu.add(new MenuItem("삭제", "/cafe/delete"));

    return cafeMenu;
  }

  //개인 하위 메뉴6 - 고객센터
  private Menu createCSMenu() {
    MenuGroup memberCSMenu = new MenuGroup("고객센터");

    memberCSMenu.add(createNoticeMenu());
    memberCSMenu.add(createAskBoardMenu());

    return memberCSMenu;
  }

  // 6-1
  private Menu createNoticeMenu() {
    MenuGroup noticeMenu = new MenuGroup("공지사항"); 

    noticeMenu.add(new MenuItem("목록", "/adminNotice/list"));
    noticeMenu.add(new MenuItem("상세", "/adminNotice/detail"));

    return noticeMenu;
  }

  // 6-2
  // 문의사항 상세보기 (댓글 목록 조회만) >> 회원 권한
  private Menu createAskBoardMenu() {
    MenuGroup askBoardMenu = new MenuGroup("문의사항");

    askBoardMenu.add(new MenuItem("등록", PER_LOGIN, "/askBoard/add"));
    askBoardMenu.add(new MenuItem("목록", "/askBoard/list"));
    askBoardMenu.add(new MenuItem("상세", "/askBoard/detail"));
    askBoardMenu.add(new MenuItem("변경", PER_LOGIN, "/askBoard/update"));
    askBoardMenu.add(new MenuItem("삭제", PER_LOGIN, "/askBoard/delete"));

    return askBoardMenu;
  }

  //-----------------------------------------------------------------------------------------------

  // 기업
  Menu createCeoMenu() {
    MenuGroup ceoMemberMenuGroup = new MenuGroup("기업");

    ceoMemberMenuGroup.add(new MenuItem("회원가입", LOGOUT, "/ceoMember/add"));
    ceoMemberMenuGroup.add(new MenuItem("로그인", LOGOUT, "/ceoMember/login"));
    ceoMemberMenuGroup.add(new MenuItem("ID/PW 찾기", LOGOUT, "/ceoMember/findIdPw"));
    ceoMemberMenuGroup.add(new MenuItem("로그아웃", CEO_LOGIN, "/ceoMember/logout"));

    ceoMemberMenuGroup.add(createCeoPageMenu());      // 마이페이지

    return ceoMemberMenuGroup;
  }

  // 기업 정보 >> 로그인하라고 뜸
  private Menu createCeoPageMenu() {
    MenuGroup ceoPageMenu = new MenuGroup("마이 페이지", CEO_LOGIN); 

    ceoPageMenu.add(new MenuItem("기업 정보", "/ceoMember/page"));
    //ceoPageMenu.add(new MenuItem("카페 등록", "/cafe/add"));
    ceoPageMenu.add(new MenuItem("카페 목록", "/ceoMember/myCafeList"));
    //    ceoPageMenu.add(new MenuItem("문의내역", "/askBoard/myList"));
    //    ceoPageMenu.add(new MenuItem("예약내역", "/cafe/reservationList"));
    //    ceoPageMenu.add(new MenuItem("후기내역", "/cafe/myReviewList"));
    //    ceoPageMenu.add(new MenuItem("탈퇴하기", "/member/delete"));

    return ceoPageMenu;
  }

}