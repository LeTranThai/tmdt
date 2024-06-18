<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Chăn Ga QST || Quên mật khẩu</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">
    <link rel="stylesheet" href="user-template/css/login.css"/>
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta3/css/all.css">

</head>
<body>
<img src="user-template/img/background/login.png" style="width: 100%;height: 100vh; position: absolute">

<div class="wrapper" id="active" style="z-index: 99999">
    <div class="form-box login">
        <h2>Xác thực</h2>
        <div id="login">
            <div class="input-box">
                <i class="fa-light fa-input-numeric"></i>
                <input type="text" name="otp" id="otp" placeholder="Nhập mã OTP"/>
            </div>
            <div class="error-box user" id="text-otp" style="display: none">
                <i class="bx bx-error-circle"></i>
                <label>OTP không được để trống!</label>
            </div>
            <div class="error-box user" id="mess" style="display: none; margin: 5px 0">
                <i class="bx bx-error-circle"></i>
                <label>OTP không đúng!</label>
            </div>
            <div id="loading1" style="color: #009d0c; margin-top: 5px; font-size: 0.9em;display: none">
                <i class="fa-duotone fa-spinner-third fa-spin"></i> Vui lòng chờ!
            </div>
            <div id="notication">
                <div class="remember-forgot"
                     style="justify-content: space-evenly; color: #009d0c; font-size: 0.96em;">
                    <i class="fa-light fa-check"></i>
                    <label>Mã otp đã được gửi đến E-mail của bạn!</label>
                </div>
            </div>
            <button class="btn" id="click_check" onclick="checkOtp()">Xác nhận</button>
            <div class="login-register">
                <p>
                    Bạn đã có tài khoản?
                    <a href="login.jsp">Đăng nhập</a>
                </p>
            </div>
        </div>
    </div>
</div>
<script>

    const click_check = document.querySelector("#click_check");
    const inputOtp = document.querySelector("#otp");


    function validateOtp() {
        if (inputOtp.value === "") {
            return textOtp.classList.add("block");
        }
        textOtp.classList.remove("block");
    }


    click_check.addEventListener("click", function (event) {
        if (!textOtp.classList.contains("block")) {
            checkOtp();
        }
    });


</script>
<script>


    function checkOtp() {
        const loading = document.getElementById("loading1");
        var xhr = new XMLHttpRequest();
        loading.style.display = "block";
        xhr.open("POST", "otp?otp=" + inputOtp.value, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                if (this.responseText === "active") {
                    loading.style.display = "none";
                    window.location.href = "login.jsp"
                } else {
                    loading.style.display = "none";
                    document.getElementById("mess").style.display = 'block';
                    document.getElementById("notication").style.display = "none"
                }
            }
        };
        xhr.send();
    }
</script>

</body>
</html>
