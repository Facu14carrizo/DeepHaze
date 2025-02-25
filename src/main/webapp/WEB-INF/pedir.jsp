<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Realizar Pedido</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #fcbb7a;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 50px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }

        h2 {
            color: #e44d26; /* Color naranja */
            text-align: center;
            margin-bottom: 25px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            color: #343a40;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
        }

        .weed-type {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 15px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .weed-type:hover {
            background-color: #ffe6d7; /* Color claro al pasar el mouse */
        }

        .weed-type img {
            max-width: 80px; /* Tamaño de la imagen */
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: #e44d26; /* Color naranja */
            border-color: #e44d26;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #d13b1b; /* Naranja más oscuro al pasar el mouse */
            border-color: #d13b1b;
        }

        /* Estilo para el tipo de weed seleccionado */
        .weed-type.selected {
            background-color: #ffe6d7; /* Color de fondo al seleccionar */
            border-color: #e44d26; /* Borde naranja más fuerte */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Sombra sutil */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    <script>
        function selectWeedType(type) {
            document.getElementById('saborEmpanada').value = type; // Actualiza el campo oculto

            // Remueve la clase 'selected' de todos los tipos
            document.querySelectorAll('.weed-type').forEach(function(element) {
                element.classList.remove('selected');
            });

            // Agrega la clase 'selected' al tipo seleccionado
            document.getElementById(type.replace(/\s/g, '')).classList.add('selected');
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Realizar Pedido</h2>
        <form method="post" action="/confirmar">
            <div class="form-group">
                <label for="nombreCliente"><i class="fas fa-user mr-2"></i> Nombre:</label>
                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-leaf mr-2"></i> Genetica:</label><br>
                
                <div class="weed-type" id="Tropicana" onclick="selectWeedType('Tropicana')">
                    <img src="${pageContext.request.contextPath}/img/Weed1.jpeg" alt="Tropicana">
                    <p>Tropicana</p>
                </div>
                
                <div class="weed-type" id="MobyDick" onclick="selectWeedType('Moby Dick')">
                    <img src="${pageContext.request.contextPath}/img/Weed2.jpeg" alt="Moby Dick">
                    <p>Moby Dick</p>
                </div>
                
                <div class="weed-type" id="AK47" onclick="selectWeedType('AK47')">
                    <img src="${pageContext.request.contextPath}/img/Weed3.jpeg" alt="AK47">
                    <p>AK-47</p>
                </div>

                <input type="hidden" id="saborEmpanada" name="saborEmpanada" required> <!-- Campo oculto para el tipo de weed -->
                
            </div>

            <div class="form-group">
                <label for="cantidad"><i class="fas fa-sort-numeric-up-alt mr-2"></i> Cantidad (gramos):</label>
                <input type="number" class="form-control" id="cantidad" name="cantidad" min="1" required>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fas fa-check mr-2"></i> Hacer Pedido</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
