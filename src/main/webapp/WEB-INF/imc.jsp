<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Calculadora de IMC</title>
</head>
<body>
    <h1>Calculadora de IMC</h1>
    <form action="result.jsp" method="post">
		Género:
		<select name="genero">
		    <option value="masculino">Masculino</option>
		    <option value="femenino">Femenino</option>
		    <option value="otro">Otro/a</option>
		    <option value="no_especificado">No quiero decirlo</option>
		</select><br>
        Edad: <input type="text" name="edad"><br>
        Peso (kg): <input type="text" name="peso"><br>
        Estatura (cm): <input type="text" name="estatura"><br>
        
        <h2>Condiciones Especiales:</h2>
        <input type="checkbox" name="condiciones[]" value="veganos"> Veganos<br>
        <input type="checkbox" name="condiciones[]" value="vegetarianos"> Vegetarianos<br>
        <input type="checkbox" name="condiciones[]" value="lactosa"> Intolerantes a la lactosa<br>
        <input type="checkbox" name="condiciones[]" value="celiacos"> Celíacos<br>
        <input type="checkbox" name="condiciones[]" value="alergias"> Alergias alimentarias<br>
        <input type="checkbox" name="condiciones[]" value="diabeticos"> Diabéticos<br>
        <input type="checkbox" name="condiciones[]" value="hipertensos"> Hipertensos<br>
        <input type="checkbox" name="condiciones[]" value="enfermedad_renal"> Enfermedad renal<br>
        <input type="checkbox" name="condiciones[]" value="alergias_mariscos"> Alergias a los mariscos<br>
        <input type="checkbox" name="condiciones[]" value="fenilcetonuria"> Fenilcetonuria (PKU)<br>
        <input type="checkbox" name="condiciones[]" value="trastornos_alimentacion"> Trastornos de la alimentación<br>
        <input type="checkbox" name="condiciones[]" value="enfermedades_intestino"> Enfermedades inflamatorias del intestino (EII)<br>
        
        <br>
        <input type="submit" value="Calcular">
    </form>
</body>
</html>
