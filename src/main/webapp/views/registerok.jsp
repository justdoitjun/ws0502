<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>


</script>

<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Log-in</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Log-in</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <h1>Login Success</h1>
                <h3> ${radm.name} 님 반갑습니다. 관리자 계정에 로그인 성공하셨습니다. </h3>
                <button class="btn_danger"><a href="?${radm.id}"> 관리자 정보 상세 확인 </a></button>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

