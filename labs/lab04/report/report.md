---
## Front matter
title: "Отчёт по лабораторной работе №4"
subtitle: "Дисциплина: Архитектура компьютера"
author: "Канева Екатерина Павловна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью работы является освоение процедуры оформления отчётов с помощью легковесного языка разметки Markdown.

# Задание

- Подготовить отчёт к текущей лабораторной работе в формате .md.
- Подготовить отчёт по предыдущей лабораторной работе в формате .md.
- В качестве отчёта предоставить отчёты в 3 форматах: .pdf, .docx и .md.

# Теоретическое введение

### **Базовые сведения о Markdown**

Чтобы создать заголовок, неоюходимо использовать знак #, например:

```
1. # This is heading 1
2. ## This is heading 2
3. ### This is heading 3
4. #### This is heading 4
```

Чтобы задать для текста полужирное начертание, необходимо заключить его в двойные звёздочки:

```
This text is **bold** 
```

Чтобы задать для текста курсивное начертание, необходимо заключить его в одинарные звёздочки:

```
This text is *italic* 
```

Чтобы задать для текста полужирное и курсивное начертание, заключите его в тройные
звездочки:

```
This is text is both ***bold and italic*** 
```

Блоки цитирования создаются с помощью символа >:

```
> The drought had lasted now for ten million years, and the reign of the terrible lizards had long since ended.
```

Неупорядоченный (маркированный) список можно отформатировать с помощью звездочек или тире:

```
- List item 1
- List item 2
- List item 3
```

Чтобы вложить один список в другой, необходимо добавить отступ для элементов дочернего списка:

```
- List item 1
   - List item A
   - List item B
- List item 2
```

Упорядоченный список можно отформатировать с помощью соответствующих цифр:

```
 1. First instruction
 2. Second instruction
 3. Third instruction
```

Чтобы вложить один список в другой, необходимо добавить отступ для элементов дочернего списка:

```
1. First instruction
    1. Sub-instruction
    1. Sub-instruction
1. Second instruction
```

 Синтаксис Markdown для встроенной ссылки состоит из части [link text] , представляющей текст гиперссылки, и части (file-name.md) – URL адреса или имени файла, на который дается ссылка:

```
[link text](file-name.md)
```

Markdown поддерживает как встраивание фрагментов кода в предложение, так и их размещение между предложениями в виде отдельных огражденных блоков. Огражденные блоки кода — это простой способ выделить синтаксис для фрагментов кода. Общий формат огражденных блоков кода:

```language
 your code goes in here
```

Внутритекстовые формулы делаются аналогично формулам LaTeX. Например:

```
$\sin^2 (x) + \cos^2 (x) = 1$
```

### Оформление изображений в Markdown

В Markdown вставить изображение в документ можно с помощью непосредственного указания адреса изображения. Синтаксис данной команды выглядит следующим образом:

```
![Подпись к рисунку](/путь/к/изображению.jpg "Необязательная подсказка"){#fig:fig1 width=70%}
```
Здесь:
* в квадратных скобках указывается подпись к изображению;
* в круглых скобках указывается URL-адрес или относительный путь изображения, а также (необязательно) всплывающую подсказку, заключённую в двойные или одиночные кавычки;
* в фигурных скобках указывается идентификатор изображения `(#fig:fig1)` для ссылки на него по тексту и размер изображения относительно ширины страницы `{width=70%}`.

Ссылка на изображение (рис. 4.1) может быть оформлена следующим образом `(рис. [-@fig:fig1])`.

### Обработка файлов в формате Markdown

Преобразовать файл README.md можно следующим образом:

```
pandoc README.md -o README.pdf
```

или так

```
pandoc README.md -o README.docx
```

Для компиляции отчетов по лабораторным работам предлагается использовать следующий Makefile

```
FILES = $(patsubst %.md, %.docx, $(wildcard *.md))
FILES += $(patsubst %.md, %.pdf, $(wildcard *.md))
LATEX_FORMAT =
FILTER = --filter pandoc-crossref
%.docx: %.md
	-pandoc "$<" $(FILTER) -o "$@"
%.pdf: %.md
	-pandoc "$<" $(LATEX_FORMAT) $(FILTER) -o "$@"
all: $(FILES)
	@echo $(FILES)
clean:
	-rm $(FILES) *~
```

# Выполнение лабораторной работы

### Установка Tex Live

Выполнение лабораторной работы было начато с установки TeX Live, Pandoc и Pandoc-Crossref. Установка шла согласно инструкции в конце текста лабораторной работы.

1. На странице официального сайта TeX Live `https://www.tug.org/texlive/acquire-netinstall.html` скачан архив `install-tl-unx.tar.gz` (рис. [-@fig:fig001]).

```
cd /tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-
unx.tar.gz
```

![Скачивание архива.](image/fig001.jpg){#fig:fig001 width=70%}

2. Распакован архив (рис. [-@fig:fig002]):

```
zcat install-tl-unx.tar.gz | tar xf -
```

![Распаковка архива.](image/fig002.jpg){#fig:fig002 width=70%}

3. Выполнен переход в распакованную папку (снимки экрана, начиная с этого, сохранены не были, т.к. ПК в какой-то момент выключился):

```
cd install-tl-*
```

4. Запущен скрипт `install-tl` c root правами

```
sudo perl ./install-tl --no-interaction
```

5. `/usr/local/texlive/2022/bin/x86_64-linux` добавлен в PATH для текущей и будущих сессий:

```
export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux
```

Далее были установлены Pandoc и Pandoc-Crossref, но снимки экрана не были сделаны по той же причине, что упомянута выше. Они были установлены также следуя инструкциям из текста лабораторной работы.

В терминале был выполнен переход в каталог курса курса, сформированный при выполнении лабораторной работы №3, были притянуты изменения с удалённого репозитория (рис. [-@fig:fig003]):

![Переход в каталог курса, притягивание изменений.](image/fig003.png){#fig:fig003 width=70%}

Были созданы файлы с помощью `make`, сформированные файлы были открыты и проверены (рис. [-@fig:fig005], [-@fig:fig006]), затем удалены с помощью команды `make clean` (рис. [-@fig:fig004]):

![Проверка файла report.pdf.](image/fig005.jpg){#fig:fig005 width=70%}

![Проверка файла report.docx.](image/fig006.jpg){#fig:fig006 width=70%}

![Удаление файлов с помощью команды make clean.](image/fig004.jpg){#fig:fig004 width=70%}

После этого было начато составление отчёта по текущей лабораторной работе (был открыт с помощью команды `gedit report.md`). Изменим заголовок работы, автора. Сделанные ранее снимки экрана переместим в подкаталог `image` каталога `report` соответствующей лабораторной работы. Дополним отчёт теоретической и основной частью, добавим выводы. После этого файлы загрузим на github (но сначала переделаем отчёт к лабораторной работе №3). Для этого нужно будет ввести команды (снимков экрана не будет, иначе я не смогу закончить этот отчёт):

```
cd ~/work/study/2022-2023/"Архитектура компьютера"/arch-pc
git add labs/lab04/report/report.md
git commit -m "Add report for lab04"
git push origin master
```

Аналогично сформируем отчёт к лабораторной работе №3. Для этого перейдём в каталог соответствующей лабораторной и откроем файл `report.md` (рис. [-@fig:fig007]):

```
cd work/study/2022-2023/"Архитектура компьютера"/arch-pc/labs/lab03/report
gedit report.md
```

![Переход в каталог и открытие файла report.md.](image/fig007.png){#fig:fig007 width=70%}

Аналогично отчёту к работе №4, начнём с изменения названия и автора, затем откроем `lab03.docx` - отчёт, созданный ранее. Из него перенесём всё в отчёт в формате `.md`, оформляя картинки как указано в тексте лабораторной работы, предварительно сохранив их все в каталог `image`. Файл с отчётом к лабораторной работе загрузим на удалённый репозиторий:

```
cd ~/work/study/2022-2023/"Архитектура компьютера"/arch-pc
git add labs/lab03/report/report.md
git commit -m "Add report for lab03"
git push origin master
```

# Выводы

Научились оформлять отчёты с помощью легковесного языка разметки Markdown.

