#!/bin/bash

# 로그를 저장할 파일 경로
LOG_FILE="netstat_logs.txt"

# 무한 루프
while true; do
    # 현재 시간과 tcp만 필터링한 netstat 출력 저장
    {
        date +"%Y-%m-%d %H:%M:%S"
        netstat -tan
    } > "$LOG_FILE" # 결과를 로그 파일에 저장 (덮어쓰기)

    # 화면 출력용 (clear는 화면에만 영향을 줌)
    clear
    cat "$LOG_FILE"

    # 대기
    sleep 0.1
done