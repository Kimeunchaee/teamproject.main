package com.ogong.pms.handler.member;

import com.ogong.pms.domain.Member;
import com.ogong.pms.handler.AuthPerMemberLoginHandler;
import com.ogong.pms.handler.Command;
import com.ogong.pms.handler.CommandRequest;
import com.ogong.request.RequestAgent;
import com.ogong.util.Prompt;

public class MemberDetailHandler implements Command {

  RequestAgent requestAgent;

  public MemberDetailHandler(RequestAgent requestAgent) {
    this.requestAgent = requestAgent;
  }

  @Override
  public void execute(CommandRequest request) throws Exception {
    System.out.println();
    System.out.println("▶ 프로필");

    //    String memberEmail = AuthPerMemberLoginHandler.getLoginUser().getPerEmail();
    //
    //    HashMap<String,String> params = new HashMap<>();
    //    params.put("memberEmail", memberEmail);
    //
    //    requestAgent.request("member.selectOne", params);
    //
    //    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
    //      System.out.println("해당 번호의 회원이 없습니다.");
    //      return;
    //    }
    //
    //    Member member = requestAgent.getObject(Member.class);

    Member member = null;

    try {
      member = AuthPerMemberLoginHandler.getLoginUser();
      System.out.println();
      System.out.printf(" [%s]\n", member.getPerNickname());
      System.out.printf(" >> 이메일 : %s\n", member.getPerEmail());
      System.out.printf(" >> 사  진 : %s\n", member.getPerPhoto());
      System.out.printf(" >> 가입일 : %s\n", member.getPerRegisteredDate());

    } catch (NullPointerException e) {
      System.out.println();
      System.out.println(" >> 프로필 실행 오류");
    }

    if (member == null) {
      return;
    }

    request.setAttribute("memberNo", member.getPerNo());

    System.out.println();
    System.out.println("1. 수정");
    System.out.println("2. 탈퇴");      
    System.out.println("0. 이전");
    while (true) {
      int selectNo = Prompt.inputInt("선택> ");
      switch (selectNo) {
        case 1 : request.getRequestDispatcher("/member/update").forward(request); return;
        case 2 : request.getRequestDispatcher("/member/delete").forward(request); return;
        case 0 : return;
        default : System.out.println(" >> 번호를 다시 선택해 주세요.");
      }
    }

  }
}
