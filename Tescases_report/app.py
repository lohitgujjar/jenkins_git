import os
import datetime
import array
from jinja2 import Environment, FileSystemLoader

headings=("Testfall","Strecke","DriveSime","Fall")
headings1=("Anzahl .xml Testfälle","Mit Strecken","Ohne Strecken")
headings2=("Anzahl Xodr Strecken","Verwendete Xdor Strecken","Unverwendete Xodr Strecken")
headings3=("Erste Xodr File","Identische Xodr Files",)
headings4=("Erste Xodr File","Zweite Xodr Files","Fall","Z. Verschiedenen Zeile")





x = datetime.datetime.now()
datum=x.year,x.month,x.strftime("%X")
basedir = os.path.abspath(os.path.dirname(__file__))

data_file = os.path.join(basedir, 'static/Result_Testcases.txt')

a_file = open(data_file, "r")

list_of_lists = []
for line in a_file:
  stripped_line = line.strip()
  line_list = stripped_line.split(",")
  list_of_lists.append(line_list)

a_file.close()


data_file2 = os.path.join(basedir, 'static/Testfälle_analuse.txt')
a_file2 = open(data_file2, "r")

list_of_lists2 = []
for line2 in a_file2:
  stripped_line2 = line2.strip()
  line_list2 = stripped_line2.split()
  list_of_lists2.append(line_list2)

a_file2.close()

data_file3 = os.path.join(basedir, 'static/xodr_Files_analyse.txt')
a_file3 = open(data_file3, "r")
list_of_listes3 = []
for line3 in a_file3:
  stripped_line3 = line3.strip()
  line_list3 = stripped_line3.split()
  list_of_listes3.append(line_list3)

a_file3.close()

data_file4 = os.path.join(basedir, 'static/Xodr_vergleich.txt')
a_file4 = open(data_file4, "r")
list_of_listes4 = []
for line4 in a_file4:
  stripped_line4 = line4.strip()
  line_list4 = stripped_line4.split(",")
  list_of_listes4.append(line_list4)

a_file4.close()

data_file5 = os.path.join(basedir, 'static/Xodr_vergleichV.txt')
a_file5 = open(data_file5, "r")
list_of_listes5 = []
for line5 in a_file5:
  stripped_line5 = line5.strip()
  line_list5 = stripped_line5.split()
  list_of_listes5.append(line_list5)

a_file5.close()




data = {'Task' : '.xml', 'Mit Strecken' : 30, 'Ohne Strecken' : 5}
data1 = {'Task' : '.xodr', 'Verwendete Xodr Strecken' : 20, 'Unverwendete .Xodr Strecken' : 4}

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)
template = env.get_template('table.html')
#source /home/basal491/Dokumente/Xmltest/Desktop/venv/bin/activate
#(‘Xodr ‘, )|contains(cell)

	
 
output = template.render(headings=headings,datum=datum, list_of_lists=list_of_lists,list_of_lists2=list_of_lists2, list_of_listes3=list_of_listes3 , data=data, data1=data1, headings1=headings1,headings2=headings2, list_of_listes4=list_of_listes4,headings3=headings3,headings4=headings4, list_of_listes5=list_of_listes5 )

data_filex = os.path.join(basedir,'graph.html')
file = open(data_filex,"w")

file.write(output)

file.close()



    #kill -9 $(ps -A | grep python | awk '{print $1}')