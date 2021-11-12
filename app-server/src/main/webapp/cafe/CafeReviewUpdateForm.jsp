<%@page import="com.ogong.pms.web.cafe.CafeHandlerHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
  .all-content {
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
    text-align: center;
  }
	</style>
</head>
<body>
<br><br>
<div class="all-content">
<form action="reviewUpdate">
	<div id='content'>
    내용 <input type="text" name="content" value="${cafeReview.content}"><br>
    평점(0~5점) <input type="number" min="0" max="5" name="grade" value="${cafeReview.grade}">
	</div>
	<input type="hidden" name="reviewNo" value="${cafeReview.reviewNo}">
	<input type="submit">
</form>
</div>
