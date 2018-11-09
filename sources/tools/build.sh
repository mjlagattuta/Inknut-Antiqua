fontmake -o variable -g InknutAntiqua.glyphs

rm -rf master_ufo

cd variable_ttf

gftools fix-nonhinting InknutAntiqua-VF.ttf InknutAntiqua-VF.ttf
gftools fix-dsig --autofix InknutAntiqua-VF.ttf
gftools fix-gasp InknutAntiqua-VF.ttf

ttx InknutAntiqua-VF.ttf

rm -rf InknutAntiqua-VF.ttf
rm -rf InknutAntiqua-VF-backup-fonttools-prep-gasp.ttf

cd ..

cat variable_ttf/InknutAntiqua-VF.ttx | tr '\n' '\r' | sed -e "s,<STAT>.*<\/STAT>,$(cat tools/patch.xml | tr '\n' '\r')," | tr '\r' '\n' > InknutAntiqua-VF.ttx

rm -rf variable_ttf

ttx InknutAntiqua-VF.ttx

rm -rf InknutAntiqua-VF.ttx