import React from 'react';
import ReactDOM from 'react-dom/client';
import Button from './Button'
import ProjectsTable from './ProjectsTable';

const ProjectsIndex = () => {
  return (
    <>
      <div className="flex justify-end">
        <Button title="Add project" />
      </div>
      <ProjectsTable/>
    </>
  )
}

const root = ReactDOM.createRoot(document.getElementById("projects-index"));
root.render(<ProjectsIndex />);
