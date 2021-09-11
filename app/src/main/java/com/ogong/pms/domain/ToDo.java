package com.ogong.pms.domain;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class ToDo implements Serializable{
  private int todoNo;           // 투두리스트 번호
  private String todoTitle;     // 투두리스트 제목
  private String todoContent;   // 투두리스트 내용
  private String todoRemark;    // 투두리스트 비고
  private Date todoDate; // 투두리스트 등록일
  private int todoStatus;   // 투두리스트 상태

  public int getTodoNo() {
    return todoNo;
  }
  public void setTodoNo(int todoNo) {
    this.todoNo = todoNo;
  }
  public String getTodoTitle() {
    return todoTitle;
  }
  public void setTodoTitle(String todoTitle) {
    this.todoTitle = todoTitle;
  }
  public String getTodoContent() {
    return todoContent;
  }
  public void setTodoContent(String todoContent) {
    this.todoContent = todoContent;
  }
  public String getTodoRemark() {
    return todoRemark;
  }
  public void setTodoRemark(String todoRemark) {
    this.todoRemark = todoRemark;
  }

  public Date getTodoDate() {
    return todoDate;
  }
  public void setTodoDate(Date todoDate) {
    this.todoDate = todoDate;
  }
  public int getTodoStatus() {
    return todoStatus;
  }
  public void setTodoStatus(int todoStatus) {
    this.todoStatus = todoStatus;
  }
}
