import React, { useEffect, useState } from "react";

import Container from "../Container";
import postsApi from "apis/posts";
import Logger from "js-logger";
import UploadModal from "../Modals/UploadModal";

const Dashboard = () => {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [open, setOpen] = useState(true)

  const fetchPosts = async () => {
    try {
      const response = await postsApi.list();
      setPosts(response.data.posts);
      setLoading(false)
    } catch (e) {
      Logger.error(e);
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchPosts()
  },[])
  return (
    <Container setModalOpen={setOpen}>
      {posts.map((post) => (
      <h1 key={post.id}>{post.caption}</h1>
      ))}
      <UploadModal open={open} setOpen={setOpen} />
    </Container>
  )
}

export default Dashboard