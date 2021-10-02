package com.ogong.pms.handler.cafe;

import java.util.Collection;
import com.ogong.pms.domain.Cafe;
import com.ogong.pms.handler.Command;
import com.ogong.pms.handler.CommandRequest;
import com.ogong.request.RequestAgent;

public class CafeListHandler implements Command {

  RequestAgent requestAgent;

  public CafeListHandler (RequestAgent requestAgent) {
    this.requestAgent = requestAgent;
  }

  @Override
  public void execute(CommandRequest request) throws Exception {
    System.out.println();
    System.out.println("▶ 장소 목록");

    requestAgent.request("cafe.selectListByMember", null);

    if (requestAgent.getStatus().equals(RequestAgent.FAIL)) {
      System.out.println("장소 목록 조회 실패!");
    } else {
      Collection<Cafe> cafeList = requestAgent.getObjects(Cafe.class);

      for(Cafe cafe : cafeList) {
        System.out.printf(" \n(%s)\n 이름 : %s\n 주소 : %s\n 예약가능인원 : %d\n"
            , cafe.getNo(), cafe.getName(), cafe.getLocation(), cafe.getBookable());
        if (cafe.getCafeStatus() == Cafe.STOP) {
          System.out.println(" * 운영 중단");
        }
      }
    }

    //    selectCafeDetailMenu(request);
  }

  //  private void selectCafeDetailMenu(CommandRequest request) throws Exception {
  //    System.out.println("\n----------------------");
  //    System.out.println("1. 상세");
  //    System.out.println("2. 검색");
  //    System.out.println("0. 이전");
  //    while (true) {
  //      int input = Prompt.inputInt(" 선택> ");
  //      switch (input) {
  //        case 1: request.getRequestDispatcher("/cafe/detail").forward(request); return;
  //        case 2: request.getRequestDispatcher("/cafe/search").forward(request); return;
  //        case 0: return;
  //        default : 
  //          System.out.println(" >> 번호를 다시 선택해 주세요.");
  //      }
  //    }
  //  }
}
