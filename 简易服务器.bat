@echo off
echo.
echo ==============================================
echo    🌐 自动启动简易HTTP服务器 🌐
echo ==============================================
echo.
echo 正在启动HTTP服务器以支持OBJ文件加载...
echo.

:: 检查Python是否安装
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 未检测到Python，请先安装Python
    echo 📥 下载地址: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo ✅ Python环境检测成功
echo.

:: 获取当前目录
set "current_dir=%cd%"
echo 📁 当前目录: %current_dir%
echo.

:: 启动HTTP服务器
echo 🚀 启动HTTP服务器中...
echo.
echo 📋 服务器信息:
echo    - 地址: http://localhost:8000
echo    - 自动打开浏览器: 是
echo    - 支持OBJ文件: 是
echo.
echo ⚠️  请保持此窗口打开！关闭窗口将停止服务器。
echo.

:: 延迟2秒后自动打开浏览器
start "" cmd /c "timeout /t 3 /nobreak >nul && start http://localhost:8000"

:: 启动Python HTTP服务器
python -m http.server 8000

echo.
echo 服务器已停止
pause 