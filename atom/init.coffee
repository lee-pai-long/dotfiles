editor = atom.workspace
editorView = atom.views.getView editor
atom.commands.dispatch editorView, 'todo-show:find-in-workspace'
