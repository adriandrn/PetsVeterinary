<%@include file="includes/header.jsp" %>

<div class="">
    <h2 class="">Mascotas</h2>
    <a href=" " class="btn btn-success btn-sm my-2"><i class="far fa-plus-square"></i> Nueva mascota</a> 
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <c:if test="${user.getRole() == 'admin'}"><th scope="col">ID</th></c:if>                    
                    <th scope="col">Nombre</th>
                    <th scope="col">Raza</th>
                    <th scope="col">Especie</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Edad</th>
                    <th scope="col">Color</th>
                    <c:if test="${user.getRole() == 'admin'}"><th scope="col">Due�o</th></c:if>
                    
                    <th scope="col">Editar</th>
                    <th scope="col">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${pets}">
                    <c:if test="${item.user_id == user.getId() && user.getRole() != 'admin'}">
                        <tr> 
                            <td>${item.name}</td>
                            <td>${item.race}</td>
                            <td>${item.specie}</td>
                            <td>${item.state}</td>
                            <td>${item.age}</td>
                            <td>${item.color}</td>
                            <td><a class="btn btn-warning btn-sm" href="PetController?op=edit&id=${item.id}"><i class="far fa-edit "></i></a></td>
                            <td><a class="btn btn-danger btn-sm" href="PetController?op=delete&id=${item.id}"
                                   onclick="return confirm('Esta seguro de eliminar a   ${item.name}?');"><i class="far fa-trash-alt"></i></a></td>
                        </tr> 
                    </c:if>

                    <c:if test="${user.getRole() == 'admin'}">
                        <tr> 
                            <th>${item.id}</th>
                            <td>${item.name}</td>
                            <td>${item.race}</td>
                            <td>${item.specie}</td>
                            <td>${item.state}</td>
                            <td>${item.age}</td>
                            <td>${item.color}</td>
                            <td>${item.user_name}</td>
                            <td><a class="btn btn-warning btn-sm" href="PetController?op=edit&id=${item.id}"><i class="far fa-edit "></i></a></td>
                            <td><a class="btn btn-danger btn-sm" href="PetController?op=delete&id=${item.id}"
                                   onclick="return confirm('Esta seguro de eliminar a   ${item.name}?');"><i class="far fa-trash-alt"></i></a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@include file="includes/footer.jsp" %>