<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Pedido</title>
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
            color: #e44d26;
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

        .btn-primary {
            background-color: #e44d26;
            border-color: #e44d26;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #d13b1b;
            border-color: #d13b1b;
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
</head>
<body>
    <div class="container">
        <h2>Editar Pedido</h2>

        <!-- Mensajes de feedback -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form method="post" action="/admin/pedidos/guardar">
            <input type="hidden" name="id" value="${pedido.id}"/>

            <div class="form-group">
                <label for="nombreCliente">Nombre del Cliente:</label>
                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente"
                       value="${pedido.nombreCliente}" required>
            </div>

            <div class="form-group">
                <label for="whatsapp">WhatsApp:</label>
                <input type="tel" class="form-control" id="whatsapp" name="whatsapp"
                       value="${pedido.whatsapp}" pattern="[0-9]{10,15}" required>
            </div>

            <!-- Selección de Genéticas y Cantidades -->
            <div class="form-group">
                <label>Selecciona las cantidades:</label>
                <c:forEach var="genetica" items="${geneticas}">
                    <div class="mb-3">
                        <label>${genetica.nombre}:</label>
                        <input type="number" class="form-control"
                               name="geneticaCantidades['${genetica.id}']"
                               min="0" max="300"
                               value="${pedido.geneticaCantidades[genetica.id]}">
                    </div>
                </c:forEach>
            </div>

            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            <a href="/admin/pedidos" class="btn btn-secondary" style="display: block; margin: 0 auto; margin-top: 10px;">Volver atrás</a>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
