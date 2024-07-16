from io import TextIOWrapper
import sys
import os
import re
from dialog.dialog import Dialog

event_folder = './Sorted/Events'

def consume_function(file_contents: TextIOWrapper):
    

def consume_child(file_contents: TextIOWrapper):
    child_obj = {
        'exit': False
    }

    open_curlies = 1
    # Skip 1 line
    file_contents.readlines(1)

    for line in file_contents:
        line = line.strip()

        if line == '}':
            open_curlies -= 1
            break
        
        props: tuple[str, str] = line.split('=', 1)
        props = [p.strip for p in props]

    for line in file_contents:
        if props[0] == 'type':                              # type
            t = props[1].split('.', 1)[1]
            child_obj.type = t[:-1]

def consume_children(file_contents: TextIOWrapper):
    children_obj = {}

    open_curlies = 1

def consume_dialog(file_contents: TextIOWrapper):
    dialog_obj = {}

    open_curlies = 2
    # Skip 2 lines
    file_contents.readlines(2)

    for line in file_contents:
        line = line.strip()

        if line == '}':
            open_curlies -= 1
            break
        
        props: tuple[str, str] = line.split('=', 1)
        props = [p.strip for p in props]

        if props[0] == 'type':                              # type
            t = props[1].split('.', 1)[1]
            dialog_obj.type = t[:-1]

        elif props[0] == 'narrator':                        # narrator
            t = re.sub(r'^\|\|\s*', '', props[1], 1)
            dialog_obj.narrator = t[:-1]

        elif props[0] == 'text':                            # text
            t = re.sub(r'^\|\|\s*', '', props[1], 1)
            dialog_obj.text = t[:-1]

        elif props[0] == 'icon':                            # icon
            t = re.sub(r'^\|\|\s*', '', props[1], 1)
            dialog_obj.icon = t[:-1]

        elif props[0] == 'who':                             # who
            t = re.sub(r'^\|\|\s*', '', props[1], 1)
            dialog_obj.who = t[:-1]

        
    return dialog_obj

def consume_array(array_string: str):
    # Passed just the stripped contents
    array_string = array_string[1:-1]
    return re.split('["\']\s*,\s*[\'"]', array_string)

def consume_quest(file_contents: TextIOWrapper):
    quest_obj = {}
    
    for line in file_contents:
        line = line.strip()
        props = line.split('=', 1)
        props = [p.strip for p in props]

        if props[0] == 'quest.id':                          # id
            quest_obj.id = props[1]
        elif props[0] == 'quest.visual':                    # visual
            quest_obj.visual = props[1]
        elif props[0] == 'quest.kindFlag':                  # kindFlag
            quest_obj.kindFlag = props[1]
        elif props[0] == 'quest.encounters':                # encounters
            quest_obj.encounters = consume_array(props[1])
        elif props[0] == 'quest.tags':                      # tags
            quest_obj.tags = consume_array(props[1])
        elif props[0] == 'local theDialog':                 # dialog
            quest_obj.dialog_obj = consume_dialog(file_contents)

for file in os.listdir(event_folder):

    path = os.path.join(event_folder, file)


    with open(path) as file_contents:
        for line in file_contents:

            if re.search(r'condition = ', line):
            # if re.search(r'cinematicMapHelper\.', line):
                print(line.strip())

            # if re.search(r'local theDialog =  dialogs.CreateDialog\(', line, re.IGNORECASE):
            #     title = line.partition('dialogs.CreateDialog("')[2]
            #     title = title.strip()[:-2]
            #     # print("Found dialog")
            #     dialog = Dialog(title, file_contents)
            #     # file_contents.readlines(dialog.lines_read)
            #     # print("End dialog")
            # else:
            #     print(line)

            # if 'cinematicMapHelper.HeroByTag("ct_survival").GUID,' in line_contents:
            #     print('--------------------------------------------')
            #     print(file_contents.read())    
            #     print('--------------------------------------------')
            #     break

    # break