from django.urls import path
from .views import home, principal, session


urlpatterns = [
    path('home/', home, name='home'),
    path('session/', session, name='session'),
]
