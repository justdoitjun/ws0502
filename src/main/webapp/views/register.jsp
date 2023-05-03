<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let register_form = {
        init : ()=>{
            $("#register_btn").click(()=>{
                register_form.send();
            });// register_btn 클릭시
        }, // register_btn - init
        send : ()=>{
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            $("#register_form").attr({
                'action': '/registerimpl',
                'method': 'post',
            });
            $("#register_form").submit();
        }   //register_form 전송
    };// register_btn

    $(()=>{
        register_form.init();
    })


</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Register Manager's account </h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Reguster</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form  class="form-horizontal" id="register_form" action="">
                    <div class="col-sm-6 text-left">
                        <div>
                            <h2 style="text-align: center">회원가입</h2>
                        </div>
                        <br><br><br>
                        <div class="input-group mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="아이디"
                                    name="id"
                                    id="id"
                            />
                        </div>

                        <div class="input-group mb-3">
                            <input
                                    type="password"
                                    class="form-control"
                                    name="pwd"
                                    id="pwd"
                                    placeholder="패스워드"
                            />
                        </div>

                        <div class="input-group mb-3">
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="이름"
                                    name="name"
                                    id="username"
                            />
                        </div>

                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" id="register_btn" onclick="">
                            회원가입
                        </button
                        >&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" id="cancel_btn"  onclick="">
                            취소
                        </button
                        >&nbsp;&nbsp;
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
