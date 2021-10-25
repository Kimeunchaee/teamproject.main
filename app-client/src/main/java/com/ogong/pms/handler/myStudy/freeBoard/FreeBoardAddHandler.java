package com.ogong.pms.handler.myStudy.freeBoard;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import com.ogong.pms.dao.FreeBoardDao;
import com.ogong.pms.dao.StudyDao;
import com.ogong.pms.domain.FreeBoard;
import com.ogong.pms.domain.FreeBoardFile;
import com.ogong.pms.domain.Member;
import com.ogong.pms.domain.Study;
import com.ogong.pms.handler.AuthPerMemberLoginHandler;
import com.ogong.pms.handler.Command;
import com.ogong.pms.handler.CommandRequest;
import com.ogong.util.Prompt;

public class FreeBoardAddHandler implements Command {

  StudyDao studyDao;
  FreeBoardDao freeboardDao;

  public FreeBoardAddHandler(StudyDao studyDao, FreeBoardDao freeboardDao) {
    this.studyDao = studyDao;
    this.freeboardDao = freeboardDao;
  }

  @Override
  public void execute(CommandRequest request) throws Exception {
    System.out.println();
    System.out.println("▶ 게시글 작성");
    System.out.println();

    int inputNo = (int) request.getAttribute("inputNo");

    Member member = AuthPerMemberLoginHandler.getLoginUser();

    Study myStudy = studyDao.findByMyNo(inputNo, member.getPerNo());

    //List<FreeBoard> freeBoardList = myStudy.getMyStudyFreeBoard();

    FreeBoard freeBoard = new FreeBoard();

    freeBoard.setStudyNo(myStudy.getStudyNo());
    freeBoard.setFreeBoardTitle(Prompt.inputString(" 제목 : "));
    freeBoard.setFreeBoardContent(Prompt.inputString(" 내용 : "));
    freeBoard.setFreeBoardViewcount(freeBoard.getFreeBoardViewcount());
    freeBoard.setFreeBoardRegisteredDate(new Date(System.currentTimeMillis()));
    freeBoard.setFreeBoardWriter(member);

    List<FreeBoardFile> fileList = new ArrayList<>();
    while (true) {
      FreeBoardFile fileName = new FreeBoardFile();
      String inputFileName = Prompt.inputString(" 첨부파일 (완료:Enter) : ");

      if (inputFileName.equals("")) {
        System.out.println(" >> 첨부파일 등록이 완료되었습니다.");
        break;
      }
      fileName.setAtcFileName(inputFileName);
      fileList.add(fileName);
    }

    freeBoard.setFreeBoardFile(fileList);
    //freeBoard.setComment(new ArrayList<>());

    String input = Prompt.inputString(" 게시글을 등록하시겠습니까? (네 / 아니오) ");
    if (!input.equalsIgnoreCase("네")) {
      System.out.println(" >> 게시글 등록을 취소하였습니다.");
      return;
    }

    freeboardDao.insert(freeBoard);

    if (!freeBoard.getFreeBoardFile().isEmpty()) {
      for (FreeBoardFile file : freeBoard.getFreeBoardFile()) {
        freeboardDao.insertFile(file, freeBoard.getFreeBoardNo());
      }
    }

    System.out.println(" >> 게시글이 등록되었습니다.");
  }
}

