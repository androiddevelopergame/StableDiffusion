@echo off
if not exist python (echo Unpacking Git and Python... & mkdir tmp & start /wait git_python.part01.exe & del git_python.part01.exe & del git_python.part*.rar)
set pypath=home = %~dp0python
if exist venv (powershell -command "$text = (gc venv\pyvenv.cfg) -replace 'home = .*', $env:pypath; $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False);[System.IO.File]::WriteAllLines('venv\pyvenv.cfg', $text, $Utf8NoBomEncoding);")

set APPDATA=tmp
set USERPROFILE=tmp
set TEMP=tmp
rem set PYTHON=c:\python38\python.exe
set PYTHON=e:\stable-diffusion-portable-main\python\python.exe
set GIT=git\cmd\git.exe
set PATH=git\cmd
set VENV_DIR=venv
rem   --skip-version-check
rem set COMMANDLINE_ARGS=--opt-sdp-attention --autolaunch --skip-torch-cuda-test
rem set COMMANDLINE_ARGS=--opt-sdp-attention --autolaunch --skip-torch-cuda-test
set COMMANDLINE_ARGS= --lowvram --always-batch-cond-uncond --xformers --api --no-half-vae --device-id=0 --opt-sdp-attention --upcast-sampling --opt-channelslast --skip-torch-cuda-test --gradio-auth-path passwords.txt
set VARNAME=VALUE
rem #  --gradio-img2img-tool color-sketch --reinstall-torch --reinstall-xformers

rem set COMMANDLINE_ARGS= --skip-torch-cuda-test --xformers --upcast-sampling --precision full --no-half --api --gradio-img2img-tool color-sketch
set CUDA_MODULE_LOADING=LAZY
set NUMEXPR_MAX_THREADS=4
set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.9,max_split_size_mb:512
set NVIDIA_VISIBLE_DEVICES=0
rem set CUDA_VISIBLE_DEVICES=0
rem set CUDA_VISIBLE_DEVICES=0,1,2,3

rem set CUDA_VISIBLE_DEVICES=1
rem e:\stable-diffusion-portable-main\python\python.exe -m pip install onnxruntime==1.12.0

git pull origin master
call webui.bat