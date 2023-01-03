
#!/bin/bash

function kayit () {
 	row=$(zenity --forms --title="MÜŞTERİ KAYIT" --text="Yeni Müşteri Ekle" --add-entry="Adınız:" --add-entry="Soyadınız:" --add-entry="Adresiniz:" --add-entry="Telefon No:" --separator="','")
 	if [[ -n $row ]]
 	then
   	cmd="sqlite3 someuser.db  \"INSERT INTO users (Fname,Lname,Adress,Telefon) VALUES ('$row')\""
   	eval $cmd
   	echo "Added data: '$row'"
   	menu
 	fi
}

#=============================================================================================

function sebze_meyve() {
zenity --width=800 --height=300  --list \
        --checklist \
        --title="Sebze-Meyve seçimi yapınız.." \
        --column "checkbox" --column="Ürün Kodu" --column="Ürün Adı" --column="Ürün Fiyatı" \
        FALSE 992383 Domates "15.99 TL" \
        FALSE 293823 Patates "9.50 TL" \
        FALSE 393825 Muz  "19.90 TL" 
}

function atıştırmalık() {
zenity --width=800 --height=300  --list \
        --checklist \
	--title="Atıştırmalık seçimi yapınız" \
        --column "checkbox"  --column="Ürün Kodu" --column="Ürün Adı" --column="Ürün Fiyatı" \
        FALSE 992383 Çikolata "6.99 TL" \
        FALSE 293823 Kek "4.50 TL" \
        FALSE 393825 Cips  "18.75 TL" \
        FALSE 393825 Kraker  "6.75 TL"
}

function et() {
zenity --width=800 --height=300  --list \
	--checklist \
        --title="Et-Donmuş Gıda seçimi yapınız" \
        --column "checkbox" --column="Ürün Kodu" --column="Ürün Adı" --column="Ürün Fiyatı" \
        FALSE 992383 Kıyma "159.99 TL" \
        FALSE 293823 Kuşbaşı "189.50 TL" \
        FALSE 393825 "Ciğer Dana"  "143.96 TL" 
}


function icecek() {
zenity --width=800 --height=300  --list \
	--checklist \
        --title="İçecek seçimi yapınız" \
        --column "checkbox" --column="Ürün Kodu" --column="Ürün Adı" --column="Ürün Fiyatı" \
        FALSE 992383 Kola "9.75 TL" \
        FALSE 293823 Gazoz "15.50 TL" \
        FALSE 393825 Süt  "12.96 TL"
}


function deterjan() {
zenity --width=800 --height=300  --list \
	--checklist \
        --title="Deterjan-Temizlik malzemesi seçimi yapınız" \
        --column "checkbox" --column="Ürün Kodu" --column="Ürün Adı" --column="Ürün Fiyatı" \
        FALSE 992383 Yumuşatıcı "55.50 TL" \
        FALSE 293823 Deterjan "115.50 TL" \
        FALSE 393825 "Çamaşır Suyu"  "15.96 TL" \
        FALSE 889562 "Silme Bezi" "26.94"
}

function kahvaltılık() {
zenity --width=800 --height=300  --list \
	--checklist \
        --title="Kahvaltılık seçimi yapınız" \
        --column "checkbox" --column="Ürün Kodu" --column="Ürün Adı" --column="Ürün Fiyatı" \
        FALSE 992383 Peynir "83.93 TL" \
        FALSE 293823 Yumurta "50.40 TL" \
        FALSE 393825 Zeytin  "85.00 TL" \
        FALSE 889562 "Kahvaltılık Gevrek" "32.90 TL"
}


function market() {
choice="$(zenity --width=400 --height=250 --list --column "" --title="HIZLI MARKET" --text="Hangi Marketten Sipariş Vermek İstersiniz?" \
"Atıştırmalık" \
"Sebze & Meyve" \
"Et & Donmuş Gıda" \
"Su & İçecek" \
"Deterjan ve Temizlik" \
"Süt & Kahvaltılık"
)"

case $choice in
          "Atıştırmalık")
           atıştırmalık
            ;;
           "Sebze & Meyve")
           sebze_meyve
            ;;
           "Et & Donmuş Gıda")
           et
            ;;
           "Su & İçecek")
           icecek
            ;;
           "Deterjan ve Temizlik")
            deterjan
            ;;
           "Süt & Kahvaltılık")
            kahvaltılık
            ;;
           *)
            echo "Hatali Seçim"
            ;;
        esac
}
#===========================================================================================
function yemek() {
zenity --width=800 --height=400  --list \
        --checklist \
        --title="Yemek Siparişi verebilitsiniz..." \
        --column "checkbox" --column="Restron Adı" --column="Yemek Adı" --column="Yemek Fiyatı" \
        FALSE PizzaKöy Pizza "83.93 TL" \
        FALSE "Köfteci Yusuf" "Köfte ekmek" "50.50 TL" \
        FALSE "Salon Burger" Burger  "55.00 TL" \
        FALSE Atmosfer Lahmacun "35.90 TL" \
	FALSE "Kebapçı Bekir Usta" Kebap "89.50 TL" \
	FALSE "Tavuk Dünyası" "Tavuk-Makarna " "65.50 TL"
}

#==========================================================================================
function menu() {

choice="$(zenity --width=400 --height=250 --list --column "" --text "Seçim yapınız:" --title="Seçim yapınız..." \
"YEMEK SİPARİŞİ" \
"HIZLI MARKET"
)"

case $choice in
"YEMEK SİPARİŞİ")
        yemek
	zenity --question \
        --width 300 \
        --height 100 \
        --text "Siparişiniz alınmıştır. Ana Menüye dönmek ister misiniz?"
        case $? in
                0) menu ;;
                1) zenity --info \
                --title "Bilgilendirme" \
                --width 300 \
                --height 80 \
                --text "Siparişiniz en kısa zamanda adresinize teslim edilecektir.Teşekkür ederiz, iyi günler dileriz."
		;;
        esac
;;
"HIZLI MARKET")
        market
	zenity --question \
        --width 300 \
	--height 100 \
        --text "Siparişiniz alınmıştır. Ana Menüye dönmek ister misiniz?"
	case $? in
		0) menu ;;
		1) zenity --info \
		--title "Bilgilendirme" \
		--width 300 \
		--height 80 \
		--text "Siparişiniz en kısa zamanda adresinize teslim edilecektir.Teşekkür ederiz, iyi günler dileriz."
		;;
	esac
;;
esac

(
         echo "# Islem devam ediyor => %0." ; sleep 0.1
         echo "25"

         echo "# Islem devam ediyor => %25." ; sleep 0.2
         echo "50"

         echo "# Islem devam ediyor => %50." ; sleep 0.2
         echo "75"

         echo "# Islem devam ediyor => %75." ; sleep 0.1
         echo "# Yonlendirme bitti!!!" ; sleep 0.5
         echo "100"

         ) |
    zenity --progress \
      --text="Sayfaya Yönlendiriliyorsunuz" \
      --percentage=0 \
      --auto-close \
      --auto-kill
}


kayit
