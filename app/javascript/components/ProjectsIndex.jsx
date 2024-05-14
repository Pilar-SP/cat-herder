import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom/client';
import Button from './Button'
import Loader from './Loader';
import ProjectsTable from './ProjectsTable';
import { DOMAIN } from 'env';

const ProjectsIndex = () => {
  const [projects, setProjects] = useState([])
  const [isLoading, setIsLoading] = useState(true)

   useEffect(()=> {
    fetch("http://" + DOMAIN + ":3000/api/v1/projects")
    .then(response => response.json())
    .then(data => setProjects(data))
    .catch(error => console.log(error))
    .finally(setIsLoading(false))
  }, [])

  return (
    <>
      <div className="flex justify-end">
        <Button title="Add project" />
      </div>
      {isLoading && <Loader /> }
      <ProjectsTable projects={projects}/>
    </>
  )
}

const root = ReactDOM.createRoot(document.getElementById("projects-index"));
root.render(<ProjectsIndex />);
