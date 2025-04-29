<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            min-height: 200px; /* Altura fija para todas las casillas */
            background-size: cover;
            background-position: center;
        }

        .weed-type-content {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.8); /* Fondo semi-transparente para legibilidad */
            padding: 10px;
            border-radius: 5px;
        }

        /* Eliminar el estilo de imagen anterior */
        .weed-type img {
            display: none;
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
                <label for="whatsapp"><i class="fab fa-whatsapp mr-2"></i> WhatsApp:</label>
                <input type="tel" class="form-control" id="whatsapp" name="whatsapp"
                       pattern="[0-9]{10,15}" placeholder="Ej: 1133445566" required>
            </div>

            <div class="form-group">
                <label><i class="fas fa-leaf mr-2"></i> Genetica:</label><br>

                <div class="row">
                    <c:forEach items="${geneticas}" var="genetica">
                        <div class="col-md-4 mb-3"> <!-- 3 columnas por fila en pantallas medianas -->
                            <div class="weed-type" 
                                 style="background-image: url('${pageContext.request.contextPath}/img/Weed${genetica.id}.jpeg');">
                                <div class="weed-type-content">
                                    <p class="h5">${genetica.nombre}</p>
                                    <p class="text-success font-weight-bold">
                                        $<fmt:formatNumber value="${genetica.precio}" maxFractionDigits="0" />/gr
                                    </p>
                                    <input type="number" 
                                           class="form-control form-control-sm" 
                                           name="geneticaCantidades['${genetica.id}']" 
                                           min="0" 
                                           value="0"
                                           style="max-width: 100px; margin: 0 auto;">
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
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
