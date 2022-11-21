# from django.shortcuts import render, HttpResponse
# from django.http import HttpResponse
# from rest_framework.response import Response
# from rest_framework.permissions import AllowAny
# from rest_framework.decorators import api_view, permission_classes

# # Create your views here.

# @api_view(['GET'],)
# @permission_classes([AllowAny],)
# def hello_django(request):
#     print('Request Received!')
#     return Response({'message: Hello PepegaClap!'}, status = 200)

from django.shortcuts import render

# Create your views here.


def hello_django(request, *args, **kwargs):
    return render(request, '../web/index.html')