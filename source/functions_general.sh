#!/bin/env bash

#########################################
##              Sourcing               ##
#########################################

src ()
{
    # Source all dev files from automation project:
    for file in ~/.automation/source/* ~/.{vars, dirs}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done
}

#########################################
##		 Directory Manipulation	       ##
#########################################

shortpath ()
{
    local input_path="$1";
    egrep "^\s*export" "$DIR_ALIAS_FILE" | sed 's/^ *export *//' | sed 's/=.*//' | {
        local var best_var to_replace best_to_replace;
        while read -s var; do
            local dir_alias="`env | egrep "^${var}\b"`";
            if [[ -n $dir_alias ]]; then
                to_replace="`echo "$dir_alias" | sed -e "s/${var}=//" -e 's/"//g'`";
                if [[ "$input_path" =~ ^"${to_replace%/}/".* ]]; then
                    if [[ ${#to_replace} -gt ${#best_to_replace} ]]; then
                        best_to_replace="$to_replace";
                        best_var="$var";
                    fi;
                fi;
            fi;
        done;
        if [[ -n $best_to_replace ]]; then
            input_path="`echo "$input_path" | sed "s:$best_to_replace:\\$$best_var:"`";
        fi;
        echo "$input_path"
    }
}

# Makes an alias for the current working directory:
diralias ()
{
    local short_path="`shortpath "$(pwd)"`";
    sed -i "" "/export $1=/d" "$DIR_ALIAS_FILE";
    echo "export $1=\"$short_path\"" >> "$DIR_ALIAS_FILE";
    sdirs
}


#########################################
##             Information             ##
#########################################

# Lists all scope extensions for Sublime snippets:
subscopes ()
{
    cat ~/.automation/snippet_scopes
}

# Used for printing errors:
echoe ()
{
    echo "${RED}Error${NC}: $@" 1>&2
}

#########################################
##		 		Navigation	           ##
#########################################

# A wrapper for the cd function:
# cd ()
# {

# }



