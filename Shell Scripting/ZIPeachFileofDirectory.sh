# To generate zip of every file inside a folder seprately then we can use the below script:
for file in /home/rohit/Desktop/Romo/countable/*.txt
do
	tar -czvf "$file-$(date +%Y-%m).tar.gz" "$file"
done

