function __op_get_tmp_file
    echo ~/.config/fish/op.cache
end

function __op_get_projects -a forceUpdate
    set -l tmpFile (__op_get_tmp_file)
    set -l array dirs

    if test -z $forceUpdate
        set forceUpdate false
    end

    if eval $forceUpdate && test -f $tmpFile
        echo "Reading from cache during update"
        read -a dirs <$tmpFile
    end

    if test -f $tmpFile && not eval $forceUpdate
        read -a dirs <$tmpFile
    else
        # These are your project directories
        for dir in ~/code/* ~/code/linio/*
            set -l dirName (basename $dir)

            # I keep all of my linio project under a sub-directory
            # This will exclude that sub directory itself from being an option
            if test $dirName = 'linio'
                continue
            end

            if test -d $dir
                if not contains $dirName $dirs
                    set -a dirs $dirName
                end
            end
        end

        echo $dirs >$tmpFile
    end

    set -l desc (_ "Project")
    printf "%s\t$desc\n" $dirs
end

function __op_get_project_dir -a project
    if test -d ~/code/$project
        echo $project
    else if test -d ~/code/linio/$project
        echo linio/$project
    end
end

function __op_usage
    echo "usage: op <project> [<args>]"
    echo
    echo "    -g, --git-client      Open git client"
    echo "    -e, --edit            Edit in \$EDITOR"
    echo "    -i, --ide             Edit in \$IDE"
    echo "    -u, --update          Update project list"
    echo "    -h, --help            This help message"
end

function op --description "Open a project"
    set -l edit false
    set -l editInIde false
    set -l gitClient false
    set -l project
    set -l projectDir
    set -l tmpFile (__op_get_tmp_file)

    for option in $argv
        switch "$option"
            case -g --git-client
                set gitClient true
            case -e --edit
                if eval $editInIde
                    echo -e "error: Cannot use editor and IDE at the same time\n"
                    __op_usage
                    return 1
                end

                set edit true
            case -i --ide
                if eval $edit
                    echo -e "error: Cannot use editor and IDE at the same time\n"
                    __op_usage
                    return 1
                end

                set editInIde true
            case -u --update
                __get_get_projects true 1>/dev/null
                return
            case -h --help
                __op_usage
                return
            case \*
                set projectDir (__op_get_project_dir $option)

                if test -z $projectDir
                    set -l autocompletedDir (string split \t -- (complete --do-complete="op $option"))

                    if set -q autocompletedDir[1]
                        set projectDir (__op_get_project_dir $autocompletedDir[1])
                    end
                end

                if test -z $projectDir
                    echo "error: Project not found."
                    __op_usage
                    return 1
                end
        end
    end

    if test -z $projectDir
        __op_usage
        return
    end

    set project (basename $projectDir)

    # Update order of auto completions based on usage
    read -a dirs <$tmpFile

    if set -l index (contains -i $project $dirs)
        set -e dirs[$index]
        set -p dirs $project
    end

    echo $dirs >$tmpFile

    # Open Project (op) begins here
    cd ~/code/$projectDir

    if eval $gitClient
        open -g ~/code/$projectDir -a /Applications/Tower.app
    end

    if eval $edit
        eval "$EDITOR ~/code/$projectDir"
    end

    if eval $editInIde
        eval "$IDE ~/code/$projectDir"
    end
end
