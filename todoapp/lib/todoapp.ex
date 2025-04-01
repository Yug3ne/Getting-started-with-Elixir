defmodule Todoapp do
  @moduledoc """
  Documentation for `Todoapp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Todoapp.hello()
      :world

  """
  def start(_type, _args) do
    Todoapp.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  @filename "todos.txt"

  defp show_menu do
    IO.puts("\n--- To-Do List Menu ---")
    IO.puts("1. View All Tasks")
    IO.puts("2. Remove Task")
    IO.puts("3. Add Task")
    IO.puts("4. Save Tasks to File")
    IO.puts("5. Exit")
    IO.write("Choose an option: ")
  end

  defp add_task(todos) do
    IO.write("Enter task name: ")
    task = IO.gets("") |> String.trim()
    updated_todos = todos ++ [task]
    IO.puts("Task added successfully")
    updated_todos
  end

  defp remove_task(todos) do
    view_tasks(todos)

    if todos == [] do
      IO.puts("No pending tasks")
      todos
    else
      IO.write("Enter task number to be removed: ")

      case Integer.parse(IO.gets("")) do
        {task_number, ""} when task_number in 1..length(todos) ->
          IO.puts("Task removed successfully")
          List.delete_at(todos, task_number - 1)

        _ ->
          IO.puts("Invalid task number")
          todos
      end
    end
  end

  defp view_tasks([]) do
    IO.puts("No tasks available.")
  end

  defp view_tasks(todos) do
    IO.puts("Your Tasks:")

    Enum.with_index(todos, 1)
    |> Enum.each(fn {task, index} ->
      IO.puts("#{index}. #{task}")
    end)
  end

  defp save_tasks(todos, filename) do
    case File.write(filename, Enum.join(todos, "\n")) do
      :ok -> IO.puts("Tasks saved successfully.")
      {:error, _} -> IO.puts("Error saving tasks.")
    end

    todos
  end

  defp load_tasks(filename) do
    if File.exists?(filename) do
      case File.read(filename) do
        {:ok, content} -> String.split(content, "\n", trim: true)
        {:error, _} -> []
      end
    else
      []
    end
  end

  defp main_loop(todos) do
    show_menu()

    case Integer.parse(String.trim(IO.gets(""))) do
      {1, ""} ->
        view_tasks(todos)
        main_loop(todos)

      {2, ""} ->
        main_loop(remove_task(todos))

      {3, ""} ->
        main_loop(add_task(todos))

      {4, ""} ->
        main_loop(save_tasks(todos, @filename))

      {5, ""} ->
        IO.puts("Exiting program.")

      _ ->
        IO.puts("Invalid choice. Try again.")
        main_loop(todos)
    end
  end

  def main do
    todos = load_tasks(@filename)
    main_loop(todos)
  end
end
