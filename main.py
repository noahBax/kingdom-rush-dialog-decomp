from io import TextIOWrapper
import sys
import os
import re
from dialog.dialog import Dialog

event_folder = './Sorted/Events'


def consume_simple_function(text: str) -> str:
    # Cut out function part
    t = re.sub(r'^\|\| .*\(\d*,\s*["\']', '', text, 1)
    t = re.sub(r'["\']\),?\s*$', '', t, 1)
    
    return t


def resolve_property(entry: str, file_contents: TextIOWrapper) -> str:

    # Remove the trailing comma
    if entry[-1] == ',':
        entry = entry[:-1]

    # || __R(3, "Unveil the spell!")
    if re.search(r'^\|\|[^"\']*\(\d*,\s*["\']', entry):     # Basic
        t = re.sub(r'^\|\|[^"\']*\(\d*,\s*["\']', '', entry, 1)
        t = re.sub(r'["\']\),?\s*$', '', t, 1)
        return t
    
    # || "mapCinematicId"
    elif re.search(r'^\|\|\s*["\']', entry):                # Simple
        t = re.sub(r'^\|\|\s*["\']', '', entry, 1)
        t = re.sub(r'["\'],?\s*$', '', t)
        return t
    
    elif re.search(r'^function', entry):                    # Complex
        # Consume lines until we hit end
        t = entry
        while True:
            line = file_contents.readline().strip()
            t += '\n' + line
            if re.match(r'end,?', line):
                return t
    
    # |t| t("ct_craft")
    elif re.search(r'^\|[^|]+\|\s*', entry)
    
    # "diceChallenge"
    elif re.match(r'^["\'].*["\'],?$', entry):              # Normal string
        return entry[1:-1]
        
    else:                                                   # Unhandled
        raise Exception(f'Unhandled function type: {entry}')


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

        if props[0] == 'type':                              # type
            t = props[1].split('.', 1)[1]
            child_obj.type = t[:-1]


def consume_children(file_contents: TextIOWrapper):
    children_obj = {}

    open_curlies = 1


def consume_dialog(file_contents: TextIOWrapper):
    dialog_obj = {}

    resolvable_properties = [
        'type',
        'narrator',
        'text',
        'icon',
        'who',
    ]

    open_curlies = 2
    # Skip 2 lines
    file_contents.readlines(2)

    for line in file_contents:
        line = line.strip()

        if line == '}':
            open_curlies -= 1
            if open_curlies == 0:
                break
            else:
                continue
        
        props: tuple[str, str] = line.split('=', 1)
        props = [p.strip for p in props]

        if props[0] in resolvable_properties:
            dialog_obj[props[0]] = resolve_property(props[1])
        
        
    return dialog_obj


def consume_array(array_string: str):
    # Passed just the stripped contents
    array_string = array_string[1:-1]
    return re.split('["\']\s*,\s*[\'"]', array_string)


def consume_quest(file_contents: TextIOWrapper):
    quest_obj = {}

    resolvable_properties = [
        'quest.id',
        'quest.visual',
        'quest.kindFlag',
    ]

    array_properties = [
        'quest.encounters',
        'quest.tags',
    ]
    
    for line in file_contents:
        line = line.strip()
        props: tuple[str, str] = line.split('=', 1)
        props = [p.strip for p in props]

        if props[0] in resolvable_properties:
            quest_obj[props[0]] = resolvable_properties(props[1])

        elif props[0] in array_properties:
            quest_obj[props[0]] = consume_array(props[1])

        elif props[0] == 'local theDialog':
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
