from django.contrib import admin

# Register your models here.
from .models import Category

@admin.register(Category)  # 管理画面に登録
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')  # 管理画面で表示する列