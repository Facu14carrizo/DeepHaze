<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DeepHaze - Inicio</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #fcbb7a; /* Color de fondo  */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            position: relative; 
        }

        .container {
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            color: #e44d26;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #e44d26;
            border-color: #e44d26;
            padding: 12px 25px;
            font-size: 1.2rem;
            border-radius: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #d13b1b;
            border-color: #d13b1b;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Estilos para pantallas más pequeñas */
        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }
            .btn-primary {
                font-size: 1rem;
            }
        }

        /* Estilos para el área secreta */
        #secret-area {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 50px;
            height: 50px;
            cursor: pointer;
            opacity: 0.05; /* Casi invisible */
            background-color: rgba(255, 255, 255, 0.1); /* Fondo muy transparente */
            transition: opacity 0.3s ease; /* Transición suave para la opacidad */
        }

        #secret-area:hover {
            opacity: 0.2; /* Ligeramente más visible al pasar el mouse */
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <a href="/admin/pedidos">
            <i class="fas fa-cannabis fa-3x mb-3" style="color: #e44d26;"></i>
        </a>
        <h1>Bienvenido a DeepHaze</h1>
        <a href="/pedir" class="btn btn-primary btn-lg">
            <i class="fas fa-shopping-cart mr-2"></i> Hacer Pedido
        </a>
    </div>

    <!-- Área secreta clickable -->
    <div id="secret-area" onclick="solicitarClave()"></div>

    <script>
    function solicitarClave() {
        const clave = prompt("🔒 Ingrese la clave de administrador:");
        if (clave === "1414") {
            window.location.href = '/admin/pedidos';
        } else {
            alert("❌ Clave incorrecta");
        }
    }
    </script>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
