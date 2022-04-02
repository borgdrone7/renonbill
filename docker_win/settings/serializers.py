from django.contrib.auth.models import User
from rest_framework import serializers

from api.serializers import ProjectSerializer


class UserSerializer(serializers.ModelSerializer):
    projects = ProjectSerializer(many=True, read_only=True)
    password = serializers.CharField(write_only=True)
    is_superuser = serializers.BooleanField(read_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'is_staff', 'is_superuser', 'password', 'projects']

    def save(self, **kwargs):
        user = User(username=self.validated_data["username"], email=self.validated_data["email"])
        user.set_password(self.validated_data["password"])
        user.save()
