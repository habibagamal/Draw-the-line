cd Backend

echo 'Compiling graph extraction files'
cd graph_extractor
sh compile.sh
cd ..

echo 'Compiling backend files'
sh compile.sh separate_colors.cc separate_colors
g++ legend_detection.cpp -std=c++0x -ggdb -llept -ltesseract `pkg-config --cflags opencv`  -o legend_detection  `pkg-config --libs opencv`
sh compile.sh match_legends.cc match_legend
g++ testx.cpp -std=c++11 -o testx
g++ testy.cpp -std=c++11 -o testy

cd scaledetection
g++ -g recognize.cpp -llept -ltesseract
cd ..

mkdir Output
