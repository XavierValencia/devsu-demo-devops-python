from django.db import DatabaseError, connection
from django.http import JsonResponse


def liveness(request):
    return JsonResponse({'status': 'ok'})


def readiness(request):
    try:
        connection.ensure_connection()
    except DatabaseError:
        return JsonResponse({'status': 'unavailable'}, status=503)
    return JsonResponse({'status': 'ok'})
