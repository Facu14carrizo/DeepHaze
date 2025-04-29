<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
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
            margin-bottom: 10px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            font-size: 1.3rem;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            font-weight: 500;
            color: #343a40;
            font-size: 0.9rem;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 6px;
            font-size: 0.9rem;
            width: 120px; /* Reducir ancho */
        }

        .btn-primary, .btn-secondary {
            width: auto;
            padding: 6px 12px;
            font-size: 0.9rem;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            margin-bottom: 0;
            color: #212529;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            padding: 0.5rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
            text-align: center;
            font-size: 0.8rem;
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
            background-color: #e44d26;
            color: white;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .switch-container {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 22px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 22px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 2px;
            bottom: 2px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #28a745;
        }

        input:checked + .slider:before {
            transform: translateX(18px);
        }

        /* Estilos para pantallas pequeñas */
        @media (max-width: 767.98px) {
            body {
                padding-top: 0;
            }

            .container {
                padding: 0;
                border-radius: 0;
                box-shadow: none;
            }

            h2 {
                font-size: 1.1rem;
                margin-bottom: 10px;
            }

            .table-responsive {
                overflow-x: auto;
            }

            .table {
                border: 0;
            }

            .table thead {
                display: none;
            }

            .table tr {
                margin-bottom: 15px;
                display: block;
                border-bottom: 2px solid #ddd;
            }

            .table td {
                display: block;
                font-size: .8em;
                text-align: right;
                border-bottom: 1px dotted #ddd;
            }

            .table td:last-child {
                border-bottom: 0;
            }

            .table td:before {
                content: attr(data-label);
                float: left;
                text-transform: uppercase;
                font-weight: bold;
            }
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
        <!-- Mensajes de feedback -->
        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show">
                ${success}
                <button type="button" class="close" data-dismiss="alert">
                    <span>&times;</span>
                </button>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show">
                ${error}
                <button type="button" class="close" data-dismiss="alert">
                    <span>&times;</span>
                </button>
            </div>
        </c:if>

        <h2 class="my-2">Configuración de Genéticas</h2>
        <form action="/admin/actualizar-geneticas" method="post">
            <c:forEach items="${geneticas}" var="genetica">
			    <div class="switch-container" style="width: 100%; display: flex; align-items: center;">
			        <input type="hidden" name="id" value="${genetica.id}" />
			        
			        <div style="flex: 1;">
			            <label>Nombre:</label><br>
			            <input type="text" 
			                   class="form-control" 
			                   name="nombre" 
			                   value="${genetica.nombre}"
			                   maxlength="14"
			                   style="width: 100%;">
			        </div>
			        
			        <div style="flex: 1; margin-left: 20px;">
			            <label>Precio:</label><br>
			            <input type="number" step="0.01" min="0"
			                   class="form-control"
			                   name="precio"
			                   value="${genetica.precio}"
			                   style="width: 100%;">
			        </div>
			        
			        <label class="switch" style="margin-top: 40px">
			            <input type="checkbox"
			                   name="activa"
			                   value="${genetica.id}"
			                   ${genetica.activa ? 'checked' : ''}>
			            <span class="slider"></span>
			        </label>
			    </div>
			</c:forEach>	
			<button type="submit" class="btn btn-success" style="display: block; margin: 0 auto;">Guardar Configuración</button>
			<button type="button" class="btn btn-secondary" style="display: block; margin: 0 auto; margin-top: 10px;" onclick="window.location.href='/';">Ir al Inicio</button>
        </form>

        <h2 class="my-2">Lista de Pedidos</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>WhatsApp</th>
                        <th>Genetica</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pedido" items="${pedidos}">
					    <tr>
					        <td data-label="ID">${pedido.id}</td>
					        <td data-label="Cliente">${pedido.nombreCliente}</td>
					        <td data-label="WhatsApp">
					            <a href="https://wa.me/+549${pedido.whatsapp}" target="_blank">
								    ${pedido.whatsapp}
								</a>
					        </td>
					        <td data-label="Genetica">
							    <c:forEach var="entry" items="${pedido.geneticaCantidades}">
							        <c:forEach var="genetica" items="${geneticas}">
							            <c:if test="${genetica.id == entry.key && entry.value > 0}">
							                ${genetica.nombre}: ${entry.value} gramos<br>
							            </c:if>
							        </c:forEach>
							    </c:forEach>
							</td>
					        <td data-label="Acciones">
					            <a href="/admin/pedidos/editar/${pedido.id}" class="btn btn-sm btn-primary">
					                <i class="fas fa-edit"></i> Editar
					            </a>
					            <a href="/admin/pedidos/borrar/${pedido.id}" class="btn btn-sm btn-danger"
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
