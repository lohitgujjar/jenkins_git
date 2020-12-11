
import os
import datetime
import array
import array as arr
from jinja2 import Environment, FileSystemLoader

headings=("Testfall","Strecke","DriveSime","Fall")
headings1=("Anzahl .xml Testfälle","Mit Strecken","Ohne Strecken")
headings2=("Anzahl Xodr Strecken","Verwendete Xdor Strecken","Unverwendete Xodr Strecken")
headings3=("Erste Xodr File","Identische Xodr Files",)
headings4=("Erste Xodr File","Zweite Xodr Files","Z. Verschiedenen Zeile")
headings5=("Unverwendete Xodr", "Unverwendete Xlmr File")





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


data_file2 = os.path.join(basedir, 'static/Testfälle_analyse.txt')
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


data_file6 = os.path.join(basedir, 'static/Testfälle_analyse.txt')
a_file6 = open(data_file6, "r")
a1 = []
a2 = []
for line6 in a_file6:
   stripped_line = line6.strip()
   data = stripped_line.split()
   a1.append(int(data[1]))
   a2.append(int(data[2]))
a_file6.close()
TM=a1[0]
TO=a2[0]

data_file7 = os.path.join(basedir, 'static/xodr_Files_analyse.txt')
a_file7 = open(data_file7, "r")
a3 = []
a4 = []
for line7 in a_file7:
   stripped_line = line7.strip()
   data = stripped_line.split()
   a3.append(int(data[1]))
   a4.append(int(data[2]))
a_file7.close()
XM=a3[0]
XO=a4[0]

data_file8 = os.path.join(basedir, 'static/Xmlr_xdor_files.txt')
a_file8 = open(data_file8, "r")
list_of_listes8 = []
for line8 in a_file8:
  stripped_line8 = line8.strip()
  line_list8 = stripped_line8.split()
  list_of_listes8.append(line_list8)

a_file8.close()


data = {'Task' : '.xml', 'Mit Strecken' : TM, 'Ohne Strecken' : TO}
data1 = {'Task' : '.xodr', 'Verwendete Xodr Strecken' : XM, 'Unverwendete .Xodr Strecken' : XO}

file_loader = FileSystemLoader('templates')
env = Environment(loader=file_loader)
template = env.get_template('table.html')
#source /home/basal491/Dokumente/Xmltest/Desktop/venv/bin/activate
#(‘Xodr ‘, )|contains(cell)

	
 
output = template.render(headings=headings,datum=datum, list_of_lists=list_of_lists,list_of_lists2=list_of_lists2, list_of_listes3=list_of_listes3 , data=data, data1=data1, headings1=headings1,headings2=headings2, list_of_listes4=list_of_listes4,headings3=headings3,headings4=headings4, list_of_listes5=list_of_listes5,headings5=headings5,list_of_listes8=list_of_listes8 )

data_filex = os.path.join(basedir,'graph.html')
file = open(data_filex,"w")

file.write(output)

file.close()



    #kill -9 $(ps -A | grep python | awk '{print $1}')
