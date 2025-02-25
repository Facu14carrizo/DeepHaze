<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Pedidos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #fcbb7a;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: 10px;
        }

        .container {
            max-width: 100%;
            margin: 0;
            background-color: #fff;
            padding: 10px;
            border-radius: 0;
            box-shadow: none;
            animation: fadeIn 0.5s ease-in-out;
        }

        h2 {
            color: #e44d26;
            text-align: center;
            margin-bottom: 15px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            font-size: 1.5rem;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .table {
            margin-top: 5px;
            width: 100%;
            border-collapse: collapse;
        }

        .table thead th {
            background-color: #e44d26;
            color: white;
            border: none;
            text-align: center;
            padding: 0.5rem;
            font-size: 0.9rem;
        }

        .table tbody td {
            border: none;
            text-align: center;
            padding: 0.5rem;
            font-size: 0.85rem;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn-edit,
        .btn-delete {
            padding: 0.3rem 0.5rem;
            font-size: 0.75rem;
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

        /* Estilos para pantallas más pequeñas */
        @media (max-width: 576px) {
            body {
                padding-top: 0;
            }

            .container {
                padding: 0;
                border-radius: 0;
                box-shadow: none;
            }

            h2 {
                font-size: 1.2rem;
                margin-bottom: 10px;
            }

            .table thead {
                display: none;
            }

            .table tbody tr {
                display: flex;
                flex-wrap: wrap;
                border: 1px solid #ddd; /* Añadir un borde alrededor de cada pedido */
                margin-bottom: 15px; /* Añadir margen entre los pedidos */
                padding: 10px; /* Añadir un poco de padding dentro de cada pedido */
            }

            .table tbody td {
                display: block;
                width: 50%;
                text-align: left;
                padding: 0.5rem;
                position: relative;
                border: none;
                box-sizing: border-box;
            }

            .table tbody td:before {
                content: attr(data-label);
                position: absolute;
                left: 0.5rem;
                top: 0.5rem;
                font-weight: bold;
                color: #e44d26;
                font-size: 0.75rem;
            }

            .table tbody td:not(:last-child) {
                border-bottom: none;
                padding-top: 1.5rem;
            }

            .table tbody td:last-child {
                width: 100%;
                text-align: right;
                padding-top: 0;
            }

            .btn-edit,
            .btn-delete {
                display: inline-block;
                width: auto;
                margin-bottom: 0;
                margin-right: 0.5rem;
                font-size: 0.7rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Lista de Pedidos</h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre del Cliente</th>
                        <th>Sabor de Empanada</th>
                        <th>Cantidad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pedido" items="${pedidos}">
                        <tr>
                            <td data-label="ID">${pedido.id}</td>
                            <td data-label="Nombre del Cliente">${pedido.nombreCliente}</td>
                            <td data-label="Sabor de Empanada">${pedido.saborEmpanada}</td>
                            <td data-label="Cantidad">${pedido.cantidad}</td>
                            <td data-label="Acciones">
                                <a href="/admin/pedidos/editar/${pedido.id}" class="btn btn-sm btn-edit">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <a href="/admin/pedidos/borrar/${pedido.id}" class="btn btn-sm btn-delete"
                                   onclick="return confirm('¿Estás seguro de que deseas borrar este pedido?');">
                                    <i class="fas fa-trash-alt"></i> Borrar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
