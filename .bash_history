cd ~/db-chatbot  # 저장소 루트로 이동
echo -e 'FROM python:3.10-slim\n\nWORKDIR /app\n\nCOPY requirements.txt .\nRUN pip install -r requirements.txt\n\nCOPY . .\n\nCMD ["python", "app.py"]' > Dockerfile
echo 'flask' > requirements.txt
echo -e 'from flask import Flask\napp = Flask(__name__)\n\n@app.route("/")\ndef home():\n    return "✅ 서버 정상 동작 중!"\n\nif __name__ == "__main__":\n    app.run(host="0.0.0.0", port=8080)' > app.py
git add Dockerfile requirements.txt app.py
git commit -m "Add minimal Flask server with Dockerfile"
git push origin master  # 또는 main
git status
ls
cd Dockerfile
ls -al
cd ~
git init
git remote add origin https://github.com/sangmok1/db-chatbot.git
git pull origin master  # 또는 main
git pull origin main
git add Dockerfile app.py requirements.txt
git commit -m "Add minimal Flask app and Dockerfile"
git push origin main
git status
git add .
git commit -m "Add minimal Flask app and Dockerfile"
git push origin
git config --global user.name "sangmok"
git config --global user.email tkdahr1331@gmail.com
git push --set-upstream origin master
git push --set-upstream origin main
git status
git add .
git commit -m "."
git push origin
git push --set-upstream origin master
git config --global credential.helper store
git status
# 1. .bash_history 무시하고 main 브랜치로 진입
git restore --staged .bash_history
git checkout -- .bash_history
git checkout main
# 2. master 브랜치 내용을 main에 덮어쓰기
git reset --hard master
# 3. 강제 push
git push origin main --force
