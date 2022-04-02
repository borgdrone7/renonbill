from django.contrib.auth.models import User
from rest_framework import viewsets, permissions

from .serializers import UserSerializer
from .permissions import IsSuperUserOrReadOnly


# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated, IsSuperUserOrReadOnly]
    queryset = User.objects.all()
    serializer_class = UserSerializer

