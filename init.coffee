# ------------------------ Atom init script --------------------------------------
#
# Author: Lee Pai Long <lee-pai-long@users.noreply.github.com>
# Date:   2016-05-13 10:00:49
# Last modified by Lee Pai Long on 2016-05-13 15:21:50
# License: WTFPL <http://www.wtfpl.net/>
# --------------------------------------------------------------------------------

editor = atom.workspace
editorView = atom.views.getView editor
atom.commands.dispatch editorView, 'todo-show:find-in-workspace'
# TODO:SMA Try to pin the todo-show tab after starting
