import React, { useEffect, useState } from "react";

import Logger from "js-logger";

import postsApi from "apis/posts";

import Container from "../Container";
import UploadModal from "../Modals/UploadModal";

const Dashboard = () => {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [open, setOpen] = useState(false);

  const fetchPosts = async () => {
    try {
      const response = await postsApi.list();
      setPosts(response.data.posts);
      setLoading(false);
    } catch (e) {
      Logger.error(e);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPosts();
  }, []);
  return (
    <Container setModalOpen={setOpen}>
      {loading ? (
        <h1>Loading.......</h1>
      ) : (
        posts?.map(post => (
          <div
            key={post.id}
            className="border m-10 flex h-screen w-full flex-col overflow-hidden rounded-lg border-gray-300  px-10 group-hover:opacity-75"
          >
            <div className="bg-gray-400 p-10">
              <h1 key={post.id}>{post.caption}</h1>
            </div>
            <img
              src={`http://127.0.0.1:3000${post.image}`}
              className="h-72 basis-1/2 object-cover object-center"
            />
          </div>
        ))
      )}
      <UploadModal open={open} setOpen={setOpen} />
    </Container>
  );
};

export default Dashboard;
