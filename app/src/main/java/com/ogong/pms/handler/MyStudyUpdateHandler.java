
package com.ogong.pms.handler;

import java.util.List;
import com.ogong.pms.domain.Study;
import com.ogong.util.Prompt;

public class MyStudyUpdateHandler extends AbstractStudyHandler {

  PromptStudy promptstudy;

  public MyStudyUpdateHandler(List<Study> newStudyList) {
    super(newStudyList);
  }

  @Override
  public void execute() {
    System.out.println();
    System.out.println("▶ 스터디 수정");
    System.out.println();

    int inputNo = Prompt.inputInt(" 번호  : ");

    Study myStudy = promptstudy.findByMyStudyNo(inputNo);

    // 조건내용 조금 수정해서 '해당 번호의 스터디가 없습니다' 출력되도록 수정해야함
    if (myStudy == null) {
      return;
    }

    if (myStudy.getOwner().getPerNo() != AuthPerMemberLoginHandler.getLoginUser().getPerNo()) {
      System.out.println(" >> 수정 권한이 없습니다.");
      return;
    }

    String studyTitle = Prompt.inputString(" 스터디명(" + myStudy.getStudyTitle()  + ") : ");
    String face = Prompt.inputString(" 대면(" + myStudy.getFace() + ") : ");
    String introduction = Prompt.inputString(" 소개글(" + myStudy.getIntroduction() + ") : ");

    int nop;
    while (true) {
      nop = Prompt.inputInt(" 인원수(" + myStudy.getNumberOfPeple() + ") : ");
      if (nop < myStudy.getNumberOfPeple()) {
        System.out.println(" >> 현재 참여 중인 인원보다 적게 수정할 수 없습니다.");
        continue;
      }
      break;
    }

    System.out.println();
    String input = Prompt.inputString(" 정말 수정하시겠습니까? (네 / 아니오) ");
    if (!input.equalsIgnoreCase("네")) {
      System.out.println(" >> 스터디 수정을 취소하였습니다.");
      return;
    }

    myStudy.setStudyTitle(studyTitle);
    myStudy.setFace(face);
    myStudy.setIntroduction(introduction);
    myStudy.setNumberOfPeple(nop);

    System.out.println(" >> 스터디가 수정되었습니다.");
  }

}