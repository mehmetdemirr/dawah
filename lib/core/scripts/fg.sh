
#npm install -g quicktype
#proje yoluna fg.sh dosyası oluştur ve içeridekileri kaydet
#chmod +x fg.sh
#proje içinde bi json dosyası oluştur json_dosyasi.json

#./fg.sh json_dosyasi json_dosyasi_pathini_ver
#örneğin

#./fg.sh user_balance lib/features/user/models

#!/bin/bash

# Gerekli değişkenleri tanımlayın
modelName="$1"
outputDir="$2"

# quicktype komutu ile modeli oluşturun
quicktype ${outputDir}/${modelName}.json -o ${outputDir}/${modelName}_model.dart --lang dart --null-safety --use-freezed --use-json-annotation --coders-in-class 

# Hata kontrolü
if [ $? -eq 0 ]; then
    echo "Dart modeli başarıyla oluşturuldu ve kaydedildi: $outputDir/$modelName"_model.dart
else
    echo "Hata: Model oluşturulurken bir sorun oluştu."
fi