#!/bin/bash

# Директории для очистки
DIRECTORIES=("$HOME/tmp" "$HOME/downloads")

# Количество дней
DAYS=30

# Функция для удаления старых файлов и папок
clean_old_files() {
    local dir=$1
    if [ -d "$dir" ]; then
        echo "Очистка директории: $dir"
        # Удаление файлов старше 30 дней
        find "$dir" -type f -mtime +$DAYS -exec rm -f {} \;
        # Удаление пустых директорий старше 30 дней
        find "$dir" -type d -mtime +$DAYS -empty -exec rmdir {} \;
        echo "Очистка завершена для: $dir"
    else
        echo "Директория $dir не существует, пропускаем."
    fi
}

# Очистка каждой директории
for dir in "${DIRECTORIES[@]}"; do
    clean_old_files "$dir"
done

echo "Очистка завершена."
