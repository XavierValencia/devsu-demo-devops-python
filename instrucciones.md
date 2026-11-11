Ejercicio Práctico
Reglas y requerimientos

Los siguientes son los entregables que deben ser enviados:

    Crear un repositorio público en Github con todos los archivos generados y colocar la URL al repositorio en los comentarios de este ejercicio.

    Adicional, subir un archivo .zip o .rar con todos los archivos generados.

    Si es posible, comparta con nosotros el link a la URL pública del EndPoint en los comentarios del ejercicio.

    Por favor comparta el resultado de la ejecución del pipeline ya sea a través de una URL pública (Ej. Github Actions, Azure DevOps Pipelines, etc.) o capturas de pantalla y resultados de ejecución en caso de que no puedas compartir un punto de acceso público. Puede incluir los mismos como documentación dentro del entregable.

    Todo el código generado debe ser versionado usando un repositorio público GITHUB creado por el candidato.

    Nota: No existe limitación en el uso de internet. Tiene 7 días para terminar el ejercicio y enviarlo.

DevOps Prueba Técnica
Habilidades:

    Administración de sistemas GNU/Linux

    Conocimiento de GIT

    Conocimiento de CI/CD pipelines, (integración y despliegue continuo)

    Conocimiento requerido (válido para plataformas Cloud y On-premise)

    Administración de Kubernetes

    Administración de Docker

    IaC con cualquier proveedor (idealmente utilizando terraform)

    Manejo básico de: Python, Java, o Node (cualquiera de estos lenguajes de programación)

Habilidades Deseables:

    Administración Cloud Computing (Microsoft Azure, Amazon AWS, Google Cloud Platform, otras)

Ejercicio Práctico DevOps

Para este ejercicio deberá elegir de base sólo una de las aplicaciones que se encuentran en el zip adjunto (Dar clic en 'Download starter project' al final de estas instrucciones):   

    Java: demo-devops-java

    Nodo: demo-devops-nodejs   

    Python: demo-devops-python

Las aplicaciones son similares, excepto que están escritas en diferentes lenguajes.   

En el archivo README.md de cada aplicación encontrará las instrucciones para ejecutar la aplicación y correr las pruebas.   
Desarrollar los siguientes puntos:

    Dockerizar la aplicación. Siéntase libre de mejorar/cambiar y agregar lo que crea necesario

        Medioambientales

        Ejecuta usuario

        Puerto

        Chequeo de salud

        Etcétera

    Se debe generar un pipeline como código que idealmente incluya los siguientes pasos:

        Compilación de código

        Pruebas unitarias

        Análisis estático del código

        Cobertura de códigos

        Construir y subir la imagen (Docker build & push)

        Opcionales:

            Escaneo de vulnerabilidades

            Puede agregar nuevos test si lo cree necesario

        Agregar en el pipeline el despliegue a Kubernetes

    Desplegar la aplicación dockerizada en kubernetes, no se requiere que utilice un entorno público, puede utilizar minikube/docker-desktop en un entorno local. Intente utilizar todos los recursos que crea necesarios, es decir, lo que utilizaría para que la app esté productiva. Se requiere por lo menos dos réplicas y escalamiento horizontal.   

        Configuraciones   

        Secretos

        Ingress

        Etc.

    Documentación en el archivo README.md, que incluya:

        Diagramas

        Si hizo el despliegue en un entorno públicamente accesible, por favor comparta la URL para poder validar el acceso.

La revisión se enfocará en:

    La correcta creación de la imagen de docker.

    La correcta utilización de los recursos de kubernetes.

    La correcta implementación del pipeline.

    Prolijidad, documentación y diagramas y todo lo que pueda ayudar al corrector a comprender las decisiones tenidas en cuenta.

    En caso de no haber cumplido con algún requerimiento, por favor indicar el por qué del mismo.

    Adicionalmente si cree que hay algún contenido adicional que deba tenerse en cuenta para el correcto despliegue de la aplicación en producción no dude en agregarlo (DNS, certificado TLS, etc.).

    La revisión se enfocará en: el seguimiento de buenas prácticas y calidad del código.

Puntos extra:

Se darán puntos adicionales si crea la infraestructura usando IaC en un proveedor público. Se deberán subir los archivos correspondientes al despliegue y las salidas correspondientes al mismo. En Terraform (aplicar/output), CloudFormation (eventos/recursos), etc.