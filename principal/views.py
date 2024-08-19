from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request, 'principal.html')


def principal(request):
    return render(request, 'principal.html')

def session(request):
    return render(request, 'login.html')
