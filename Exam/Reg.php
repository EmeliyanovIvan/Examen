<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TestBd</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
        function validateForm() {
            var login = document.forms["RegForm"]["Login"].value;
            var password = document.forms["RegForm"]["Parol"].value;
            var Fam = document.forms["RegForm"]["Familia"].value;
            var Im = document.forms["RegForm"]["Ima"].value;
            var Otch = document.forms["RegForm"]["Otchestvo"].value;

            if (login == "" || password == "" || Fam == "" || im == "" || Otch == "") {
                alert("Пожалуйста, заполните все поля.");
                return false;
            }
        }
    </script>
</head>
<body>
<?php
$host='localhost';
$db='examen';
$user='root';
$password='';
$link=mysqli_connect($host,$user,$password,$db) or die("Ошибка".mysqli_error($link));
    if(isset ($_POST['Familia']) && isset ($_POST['Ima']) && isset($_POST['Otchestvo']) && isset ($_POST['Login']) && isset ($_POST['Parol'])){
    $Fam=$_POST['Familia'];
    $Ima=$_POST['Ima'];
    $Otchestvo=$_POST['Otchestvo'];
    $Log=$_POST['Login'];
    $password = $_POST['Parol'];
    if($Fam && $Ima && $Otchestvo && $Log && $password){
        $query = "insert into polzovatel(Familia,Ima,Otchestvo,Login,Parol) values('$Fam', '$Ima', '$Otchestvo','$Log', '$password')";
        $result = mysqli_query($link, $query) or die ("Ошибка".mysqli_error($link));
        header("Location: Avtori.php");
        }
        }
?>

<form method="POST" name="RegForm" onsubmit="return validateForm()">
<div class="Reg">
  <div class="form">
    <h2>Регистрация</h2>
    <input minlength="3" maxlength="30" pattern="[А-Яа-яЁё\s]+" type="text" placeholder="Фамилия" name="Familia">
    <input minlength="3" maxlength="30" pattern="[А-Яа-яЁё\s]+" type="text" placeholder="Имя" name="Ima">
    <input minlength="3" maxlength="30" pattern="[А-Яа-яЁё\s]+" type="text" placeholder="Отчество" name="Otchestvo">
    <input minlength="10" maxlength="50" pattern=".*@gmail.com.*" title="Пожалуйста, укажите правильный формат такой как email@gmail.com" type="text" placeholder="Логин" name="Login">
    <input minlength="8" maxlength="50" type="text" placeholder="Пароль" name="Parol">
    <input type="submit" value="Зарегистрироваться" class="submit">
  </div>
</div>
</form>
</body>
</html>

