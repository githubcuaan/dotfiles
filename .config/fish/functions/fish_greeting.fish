function fish_greeting
    echo -ne '\x1b[38;5;16m'
    echo " _____        _____         _   " 
    echo "|  _  |___   |  _  |___ ___| |_ "
    echo "|     |   |  |     |  _|  _|   |"
    echo "|__|__|_|_|  |__|__|_| |___|_|_|"
    echo ""

    set_color normal
    command -v fastfetch &> /dev/null && fastfetch 
    
    # 2. Hack con trỏ: Lùi ngược lên 11 dòng (để ngang hàng với cái bảng info)
    # *Lưu ý: Nếu bảng fastfetch của bồ dài hơn hoặc ngắn hơn, bồ chỉnh số 11 này lại nha!
    echo -en "\e[19A"
    
    # 3. Thả con mèo ra cho quẩy ở lề phải
    kitten icat --align right ~/Pictures/Gifs/baloon_cat.gif
end
