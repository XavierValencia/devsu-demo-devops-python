from django.contrib import admin
from django.urls import path, include

from .health import liveness, readiness

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('health/live', liveness, name='health-live'),
    path('health/ready', readiness, name='health-ready'),
]
