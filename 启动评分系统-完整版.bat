@echo off
echo.
echo ==============================================
echo    🚀 3D手-相机交互评分系统 (最新增强版) 🚀
echo ==============================================
echo.
echo 正在启动支持OBJ文件加载的浏览器...
echo.

:: 获取当前目录的绝对路径
set "current_dir=%cd%"
set "html_file=%current_dir%\index.html"

:: 尝试用Chrome启动（允许本地文件访问）
echo 🔍 正在查找Chrome浏览器...
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    echo ✅ 找到Chrome，启动中...
    start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files --disable-web-security --user-data-dir="%TEMP%\chrome_dev_session" "file:///%html_file%"
    goto :success
)

if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    echo ✅ 找到Chrome (x86)，启动中...
    start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files --disable-web-security --user-data-dir="%TEMP%\chrome_dev_session" "file:///%html_file%"
    goto :success
)

if exist "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" (
    echo ✅ 找到Chrome (本地)，启动中...
    start "" "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files --disable-web-security --user-data-dir="%TEMP%\chrome_dev_session" "file:///%html_file%"
    goto :success
)

:: 如果找不到Chrome，用默认浏览器
echo ⚠️  未找到Chrome，使用默认浏览器...
start "" "%html_file%"

:success
echo.
echo ✅ 评分系统已启动！
echo.
echo 🔧 最新修复内容：
echo    - ✅ 修复了Three.js OBJ加载器引用问题
echo    - ✅ 增强了3D模型颜色显示效果
echo    - ✅ 添加了智能诊断系统
echo    - ✅ 改进了模型缩放和定位算法
echo.
echo 📋 功能说明：
echo    - 支持完整OBJ文件加载和显示
echo    - 智能检测并处理顶点颜色
echo    - 3D模型可以旋转、缩放、平移
echo    - 完整的评估和导出功能
echo.
echo 💡 使用提示：
echo    - 页面加载后会自动运行诊断测试
echo    - 如果看到"OBJ文件访问测试通过"则可以看到真实3D模型
echo    - 如果提示使用替代模型，功能依然完整可用
echo    - 评估完成后可导出JSON/CSV结果
echo.
echo 🔧 故障排除：
echo    - 如果模型仍然显示黑色，请运行"简易服务器.bat"
echo    - 确保viz_mesh文件夹中有OBJ文件
echo    - 检查浏览器控制台是否有错误信息
echo.
pause 