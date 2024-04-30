import React from "react";

const ProjectsTable = (projects) => {
  const clickHandler = (id) => {
    location.href = `/projects/${id}`;
  };

  if (projects.projects.length == 0) {
    return (
      <div class="flex items-center justify-center">
        <figure class="flex justify-center relative max-w-md">
          <img
            class="rounded-lg"
            src="https://cdn.dribbble.com/users/1539273/screenshots/3199784/media/ef85bc9595af31463cade886b8aef5dc.gif"
            alt="an image stating no projects yet"
          />

          <figcaption class="font-light text-teal-700 absolute px-4 text-lg text-gray bottom-6">
            <p>No projects yet</p>
          </figcaption>
        </figure>
      </div>
    );
  }

  return (
    <div className="overflow-x-auto shadow-md sm:rounded-lg">
      <table className="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" className="px-6 py-3">
              Project
            </th>
            <th scope="col" className="px-6 py-3">
              <div className="flex items-center">
                Priority
                <a href="#">
                  <svg
                    className="w-3 h-3 ms-1.5"
                    aria-hidden="true"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M8.574 11.024h6.852a2.075 2.075 0 0 0 1.847-1.086 1.9 1.9 0 0 0-.11-1.986L13.736 2.9a2.122 2.122 0 0 0-3.472 0L6.837 7.952a1.9 1.9 0 0 0-.11 1.986 2.074 2.074 0 0 0 1.847 1.086Zm6.852 1.952H8.574a2.072 2.072 0 0 0-1.847 1.087 1.9 1.9 0 0 0 .11 1.985l3.426 5.05a2.123 2.123 0 0 0 3.472 0l3.427-5.05a1.9 1.9 0 0 0 .11-1.985 2.074 2.074 0 0 0-1.846-1.087Z" />
                  </svg>
                </a>
              </div>
            </th>
            <th scope="col" className="px-6 py-3">
              Status
            </th>
            <th scope="col" className="px-6 py-3">
              <div className="flex items-center">Description</div>
            </th>
          </tr>
        </thead>
        <tbody className="cursor-pointer">
          {projects.projects.map((project) => {
            return (
              <tr
                key={project.id}
                onClick={() => clickHandler(project.id)}
                className="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
              >
                <th
                  scope="row"
                  className="px-6 py-4 font-medium text-gray-900 whitespace-normal dark:text-white"
                >
                  {project.name}
                </th>
                <td className="px-6 py-4">{project.priority}</td>
                <td className="px-6 py-4">
                  <span className="text-nowrap">{project.status}</span>
                </td>
                <td className="px-6 py-4">{project.description}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default ProjectsTable;
