<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
        function validateForm() {
            var login = document.forms["loginForm"]["Login"].value;
            var password = document.forms["loginForm"]["Parol"].value;
            
            if (login == "" || password == "") {
                alert("Пожалуйста, заполните все поля логина и пароля.");
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
$log1="";
$pass1="";

$link=mysqli_connect($host,$user,$password,$db) or die("Ошибка".mysqli_error($link));
if(isset($_POST['Login']) && isset ($_POST['Parol'])){
    $Log = $_POST['Login'];
    $passwor = $_POST['Parol'];
    if(($Log=="")||($passwor==""))
			{
				echo("<h3 style='color:white;'>Вы не ввели логин или пароль!</h3>");
			}
            else{
$query = "select * from polzovatel where Login='$Log' and Parol='$passwor'";
$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link)); 
		if($result) 
    while ($row = mysqli_fetch_assoc($result)) {
		
		$log1=$row['Login'];
		$pass1=$row['Parol'];
				
	}
	if(($log1!=$Log)&&($pass1!=$passwor))
	{

	}
    else{
		    header("Location: index.html");
		}
		
		}
    }
?>
<form method="POST" name="loginForm" onsubmit="return validateForm()">
<div class="login">
  <div class="form">
    <h2>Авторизация</h2>
    <input type="text" minlength="10" maxlength="50" placeholder="Логин" name="Login">
    <input type="password" minlength="8" maxlength="50" placeholder="Пароль" name="Parol">
    <input type="submit" value="Вход" class="submit">
    <input type="button" onclick="location.href='Reg.php';" value="Регистрация" class="submit">
  </div>
</div>
</form>
</body>
</html>

