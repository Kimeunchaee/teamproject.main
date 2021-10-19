package com.ogong.pms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ogong.pms.dao.AdminDao;
import com.ogong.pms.domain.Admin;
import com.ogong.pms.domain.AdminNotice;

public class MariadbAdminDao implements AdminDao {

  Connection con;

  public MariadbAdminDao(Connection con) {
    this.con = con;
  }

  // ----------- [ 관리자 ] ------------------------------------------------------

  @Override
  public void updateNickname(Admin admin) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "update admin set"
            + " nickname=?"
            + " where admin_no=?")) {

      stmt.setString(1, admin.getMasterNickname());
      stmt.setInt(2, admin.getMasterNo());

      if (stmt.executeUpdate() == 0) {
        throw new Exception("관리자 닉네임 데이터 변경 실패!");
      }
    }
  }

  @Override
  public void updateEmail(Admin admin) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "update admin set"
            + " email=?"
            + " where admin_no=?")) {

      stmt.setString(1, admin.getMasterEmail());
      stmt.setInt(2, admin.getMasterNo());

      if (stmt.executeUpdate() == 0) {
        throw new Exception("관리자 이메일 데이터 변경 실패!");
      }
    }
  }

  @Override
  public void updatePassword(Admin admin) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "update admin set"
            + " password=password(?)"
            + " where admin_no=?")) {

      stmt.setString(1, admin.getMasterPassword());
      stmt.setInt(2, admin.getMasterNo());

      if (stmt.executeUpdate() == 0) {
        throw new Exception("관리자 비밀번호 데이터 변경 실패!");
      }
    }
  }

  @Override
  public Admin findByAdminNo(int no) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "select admin_no,nickname,email,password from admin where admin_no=" + no);
        ResultSet rs = stmt.executeQuery()) {

      if (!rs.next()) {
        return null;
      }

      Admin admin = new Admin();
      admin.setMasterNo(rs.getInt("admin_no"));
      admin.setMasterNickname(rs.getString("nickname"));
      admin.setMasterEmail(rs.getString("email"));
      admin.setMasterPassword(rs.getString("password"));

      return admin;
    }
  }

  @Override
  public Admin findByEmailAndPassword(String email, String password) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "select admin_no,nickname,email,password from admin" 
            + " where email=? and password=password(?)")) {

      // 일반문장은 try 안에 선언할 수 없다.
      stmt.setString(1, email);
      stmt.setString(2, password);

      // ResultSet을 자동 close 하기위해 try 안에 try를 선언한다.
      try (ResultSet rs = stmt.executeQuery()) {
        if (!rs.next()) {
          return null;
        }

        Admin admin = new Admin();
        admin.setMasterNo(rs.getInt("admin_no"));
        admin.setMasterNickname(rs.getString("nickname"));
        admin.setMasterEmail(rs.getString("email"));
        admin.setMasterPassword(rs.getString("password"));

        return admin;
      }
    }
  }

  // ---------- [ 공지사항 ] -----------------------------------------------------

  @Override
  public void insert(AdminNotice adminNotice) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "insert into notice(title,content,create_dt) values(?,?,?)",
        Statement.RETURN_GENERATED_KEYS)) {

      stmt.setString(1, adminNotice.getAdminNotiTitle());
      stmt.setString(2, adminNotice.getAdminNotiContent());
      stmt.setDate(3, adminNotice.getAdminNotiRegisteredDate());

      if (stmt.executeUpdate() == 0) {
        throw new Exception("공지사항 데이터 입력 실패!");
      }

      // 공지사항 PK 값 꺼내기
      int noticeNo = 0;
      try (ResultSet pkRS = stmt.getGeneratedKeys()) {
        if (pkRS.next()) {
          noticeNo = pkRS.getInt("adminNotice_no");
        }
      }

      if (adminNotice.getAdminNotiFile() != null) {
        // notice_file 테이블에 추가하기
        try (PreparedStatement stmt2 = con.prepareStatement(
            "insert into notice_file(notice_file_no,notice_no,filepath) values(?,?,?)")) {

          stmt2.setInt(1, adminNotice.getAdminNotiFileNo());     // 첨부파일 번호
          stmt2.setInt(2, noticeNo);           // 위에서 PK로 꺼낸 공지사항 번호
          stmt2.setString(3, adminNotice.getAdminNotiFile()); // 첨부파일명
          stmt2.executeUpdate(); 
        }
      }
    }
  }

  @Override
  public void update(AdminNotice notice) throws Exception {

  }

  @Override
  public void delete(int noticeNo) throws Exception {

  }

  @Override
  public List<AdminNotice> findAll() throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "select"
            + "  n.notice_no,n.title,n.content,n.create_dt,nf.notice_file_no,nf.filepath"
            + " from notice n"
            + "  left outer join notice_file nf on n.notice_no=nf.notice_no"
            + " order by n.notice_no asc");
        ResultSet rs = stmt.executeQuery()) {

      ArrayList<AdminNotice> list = new ArrayList<>();

      while (rs.next()) {
        AdminNotice adminNotice = new AdminNotice();
        adminNotice.setAdminNotiNo(rs.getInt("notice_no"));
        adminNotice.setAdminNotiTitle(rs.getString("title"));
        adminNotice.setAdminNotiContent(rs.getString("content"));
        adminNotice.setAdminNotiRegisteredDate(rs.getDate("create_dt"));
        adminNotice.setAdminNotiFileNo(rs.getInt("notice_file_no"));
        adminNotice.setAdminNotiFile(rs.getString("filepath"));
        list.add(adminNotice);
      }

      return list;
    }
  }

  @Override
  public AdminNotice findByNoticeNo(int noticeNo) throws Exception {
    try (PreparedStatement stmt = con.prepareStatement(
        "select notice_no,title,content,create_dt from admin where notice_no=" + noticeNo);
        ResultSet rs = stmt.executeQuery()) {

      if (!rs.next()) {
        return null;
      }

      AdminNotice adminNotice = new AdminNotice();
      adminNotice.setAdminNotiNo(rs.getInt("notice_no"));
      adminNotice.setAdminNotiTitle(rs.getString("title"));
      adminNotice.setAdminNotiContent(rs.getString("content"));
      adminNotice.setAdminNotiRegisteredDate(rs.getDate("create_dt"));
      //      adminNotice.setAdminNotiFileNo(rs.getInt("notice_file_no"));
      //      adminNotice.setAdminNotiFile(rs.getString("filepath"));

      return adminNotice;
    }
  }

}

// 확인용
/*
select
  n.notice_no,n.title,n.content,n.create_dt,nf.notice_file_no,nf.filepath
 from notice n
  left outer join notice_file nf on n.notice_no=nf.notice_no
 order by n.notice_no asc
 */
